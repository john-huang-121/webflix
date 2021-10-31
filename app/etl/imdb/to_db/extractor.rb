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
            movie = Movie.create(transformed_cols) 
            unless movie.save!
              puts "Failed because #{row[0]}"
            end
          end
          puts "Done."
        end
      end
    end
  end