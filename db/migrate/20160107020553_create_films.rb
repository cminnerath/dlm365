class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :imdb_id
      t.integer :year

      t.timestamps null: false
    end
  end
end
