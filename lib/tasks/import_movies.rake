desc "Import movies"
require './app/etl/imdb/to_csv/extractor'
require './app/etl/imdb/to_csv/transformer'
require './app/etl/imdb/to_csv/loader'
task :import_movies do
  Imdb::ToCsv::Extractor.read_titles_and_fetch_details
end