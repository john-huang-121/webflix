# frozen_string_literal: true


require 'csv'

module Imdb
  module ToCsv
    class LoadDetails
      def self.load_to_csv(rows)
        csv_rows = [headers] + rows
        File.write("app/etl/imdb/fixtures/movie_details.csv", csv_rows.map(&:to_csv).join)
      end

      def self.headers
        [
          'title',
          'year',
          'rated',
          'released',
          'runtime',
          'genre',
          'director',
          'writer',
          'actors',
          'plot',
          'language',
          'country',
          'awards',
          'poster',
          'metascore',
          'imdbRating',
          'type',
          'boxOffice',
          'production',
          'website',
          'imdbID'
        ]
      end
    end
  end
end