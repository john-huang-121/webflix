# frozen_string_literal: true


require 'csv'

module Imdb
  module ToCsv
    class LoadTrailers
      def self.load_to_csv(rows)
        headers = ['imdbID', 'trailer']
        csv_rows = [headers] + rows
        File.write("app/etl/imdb/fixtures/movie_trailers.csv", csv_rows.map(&:to_csv).join)
      end
    end
  end
end