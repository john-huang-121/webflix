# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'openssl'
require 'csv'

  module Imdb
    module ToCsv
      class ExtractTrailers
        def self.read_ids_and_fetch_trailers
          puts "Starting trailers extract..."
          csv_text = File.open('app/etl/imdb/fixtures/movies.csv')
          csv = CSV.parse(csv_text, :headers => true)

          csv_cols = []
          csv.each do |row|
            break if csv_cols.length > 0 # To limit api usage
            imdb_id = row[2]
            response = fetch_trailer_by_imdb_id(imdb_id) 
            if !response["Error"]
              transformed_cols = TransformTrailer.map_columns(response)
              csv_cols << transformed_cols
              
            else
              puts "Failed because #{response["Error"]}: #{imdb_id}"
            end
          end
          puts "Loading to csv..."
          LoadTrailers.load_to_csv(csv_cols)
          puts "Done."
        end

      def self.fetch_trailer_by_imdb_id(imdb_id)
        key = ENV["IMDB_TRAILER_API_KEY"]
        url = URI("https://imdb-api.com/en/API/YouTubeTrailer/#{key}/#{imdb_id}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        
        response = http.request(request)
        response.read_body
      end
    end
  end
end