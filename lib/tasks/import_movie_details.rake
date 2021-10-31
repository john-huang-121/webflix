desc "Import movies"
require './app/etl/imdb/to_csv/extract_details'
require './app/etl/imdb/to_csv/transform_details'
require './app/etl/imdb/to_csv/load_details'

task :import_movie_details do
  Imdb::ToCsv::ExtractDetails.read_ids_and_fetch_details
end