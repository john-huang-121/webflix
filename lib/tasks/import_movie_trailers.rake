require './app/etl/imdb/to_csv/extract_trailers'
require './app/etl/imdb/to_csv/transform_trailer'
require './app/etl/imdb/to_csv/load_trailers'

desc "Import movie trailers"
task :import_movie_trailers => :environment do
  Imdb::ToCsv::ExtractTrailers.read_ids_and_fetch_trailers
end