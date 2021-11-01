# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'openssl'
require 'csv'

  module Imdb
    module ToCsv
      class ExtractDetails
        def self.read_ids_and_fetch_details
          puts "Starting details extract..."
          csv_text = File.open('app/etl/imdb/fixtures/movies.csv')
          csv = CSV.parse(csv_text, :headers => true)

          csv_cols = []
          csv.each do |row|
            # break if csv_cols.length > 10 # To limit api usage
            imdb_id = row[2]
            response = fetch_details_by_imdb_id(imdb_id) 
            if !response["Error"]
              transformed_cols = TransformDetails.map_columns(response, imdb_id)
              csv_cols << transformed_cols
              
            else
              puts "Failed because #{response["Error"]}: #{imdb_id}"
            end
          end
          puts "Loading to csv..."
          LoadDetails.load_to_csv(csv_cols)
          puts "Done."
        end

      def self.fetch_details_by_imdb_id(imdb_id)
        url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?plot=short&r=json&type=movie&i=#{imdb_id}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'movie-database-imdb-alternative.p.rapidapi.com'
        request["x-rapidapi-key"] = ENV['IMDB_API_KEY']
        
        response = http.request(request)
        response.read_body
      end
    end
  end
end