# frozen_string_literal: true


require 'csv'

module Imdb
  module ToCsv
    class Loader
      def self.load_to_csv(rows)
        headers = ["title", "year", "imdbID", "type", "poster"]
        csv_rows = [headers] + rows
        File.write("app/etl/imdb/fixtures/movies.csv", csv_rows.map(&:to_csv).join)
      end
    end
  end
end