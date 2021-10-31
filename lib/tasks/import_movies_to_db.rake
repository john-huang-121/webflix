require './app/etl/imdb/to_db/extractor'
require './app/etl/imdb/to_db/transformer'

desc "Import movies"
task :import_movies_to_db => :environment do
  Imdb::ToDB::Extractor.read_from_csv
end