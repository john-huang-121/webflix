# frozen_string_literal: true

module Imdb
  module ToCsv
    class TransformTrailer
      def self.map_columns(row)
        json_response = JSON.parse(row)
        [
          json_response['imDbId'],
          json_response['videoUrl'],
        ]
      end
    end
  end
end