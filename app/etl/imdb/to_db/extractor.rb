# frozen_string_literal: true

require 'csv'


  module Imdb
    module ToDB
      class Extractor
        def self.read_from_csv
          puts "Starting to read from movie_details.csv..."
          csv_text = File.open('app/etl/imdb/fixtures/movie_details.csv')
          csv = CSV.parse(csv_text, :headers => true)
          puts "Mapping and saving to db..."
          csv.each do |row|
            transformed_cols = Transformer.map_columns(row)
            update_or_create_movie(transformed_cols)
          end
          puts "Done."
        end

        def self.update_or_create_movie(transformed_cols)
          movie = Movie.find_by(imdb_id: transformed_cols[:imdb_id])
          if movie.present?
            puts "Failed to update #{row[0]}" unless movie.update!(transformed_cols)
          else
            puts "Failed to save #{row[0]}" unless Movie.create!(transformed_cols)
          end
        end
      end
    end
  end