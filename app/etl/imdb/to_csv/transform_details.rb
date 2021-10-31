# frozen_string_literal: true

module Imdb
  module ToCsv
    class TransformDetails
      def self.map_columns(response)
        json_response = JSON.parse(response)
        if json_response["Response"] == "True"
          json_search = json_response.symbolize_keys
          [
            json_search[:Title],
            json_search[:Year],
            json_search[:Rated],
            json_search[:Released],
            json_search[:Runtime],
            json_search[:Genre],
            json_search[:Director],
            json_search[:Writer],
            json_search[:Actors],
            json_search[:Plot],
            json_search[:Language],
            json_search[:Country],
            json_search[:Awards],
            json_search[:Poster],
            json_search[:Metascore],
            json_search[:imdbRating],
            json_search[:Type],
            json_search[:BoxOffice],
            json_search[:Production],
            json_search[:Website],
          ]
        else
          json_response
        end
      end
    end
  end
end