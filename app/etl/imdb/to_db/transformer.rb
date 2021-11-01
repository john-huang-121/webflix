# frozen_string_literal: true

module Imdb
  module ToDB
    class Transformer
      def self.map_columns(row)
        {
          title: row[0],
          year: row[1],
          rated: row[2],
          released: row[3],
          runtime: row[4],
          genre: map_to_array(row[5]),
          director: row[6],
          writer: map_to_array(row[7]),
          actors: map_to_array(row[8]),
          plot: row[9],
          language: map_to_array(row[10]),
          country: row[11],
          awards: row[12],
          poster: row[13],
          metascore: row[14],
          imdbRating: row[15],
          boxOffice: map_dollars(row[17]),
          production: map_dollars(row[18]),
          website: map_website(row[19]),
          imdb_id: row[20],
        }
      end

      def self.map_to_array(col)
        col.split(", ")
      end

      def self.map_website(col)
        return nil if col == "N/A"
        col
      end

      def self.map_dollars(col)
        return nil if col == "N/A"
        col[1..-1].split(",").join("").to_i
      end
    end
  end
end