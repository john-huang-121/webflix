class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.string :rated, null: false
      t.string :released, null: false
      t.integer :runtime, null: false
      t.string :genre, array: true, default: []
      t.string :director, null: false
      t.string :writer, array: true, default: []
      t.string :actors, array: true, default: []
      t.text :plot, null: false
      t.string :language, array: true, default: []
      t.string :country
      t.text :awards
      t.string :poster, null: false
      t.float :metascore
      t.float :imdbRating
      t.integer :boxOffice
      t.integer :production
      t.string :website
      t.string :trailer

      t.timestamps
    end
  end
end
