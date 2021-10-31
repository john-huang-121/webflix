# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'openssl'
require 'csv'

  module Imdb
    module ToCsv
      class Extractor
        def self.read_titles_and_fetch_details
          puts "Starting title extract..."
          csv_text = File.open('app/etl/imdb/fixtures/titles.csv')
          csv = CSV.parse(csv_text, :headers => true)

          csv_cols = []
          csv.each do |row|
            # break if csv_cols.length > 10 # To limit api usage
            response = fetch_details_by_movie_title(row[0]) 
            if !response["Error"]
              transformed_cols = Transformer.map_columns(response)
              csv_cols << transformed_cols
              
            else
              puts "Failed because #{response["Error"]}: #{row[0]}"
            end
          end
          puts "Loading to csv..."
          Loader.load_to_csv(csv_cols)
          puts "Done."
        end

        def self.fetch_details_by_movie_title(title)
          encoded_title = ERB::Util.url_encode(title)

          url = URI("https://movie-database-imdb-alternative.p.rapidapi.com/?s=#{encoded_title}&r=json&type=movie&page=1")

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

