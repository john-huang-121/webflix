# frozen_string_literal: true

  module Imdb
    module ToCsv
      class Transformer

        def self.map_columns(response)
          json_response = JSON.parse(response)
          if json_response["Response"] == "True"
            json_search = json_response["Search"].first.symbolize_keys
            [
              json_search[:Title],
              json_search[:Year],
              json_search[:imdbID],
              json_search[:Type],
              json_search[:Poster]
            ]
          else
            json_response
          end
        end
      end
    end
  end