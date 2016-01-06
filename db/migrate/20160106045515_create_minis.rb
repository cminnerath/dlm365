class CreateMinis < ActiveRecord::Migration
  def change
    create_table :minis do |t|
      t.string :film_title
      t.string :imdb_id
      t.integer :rating

      t.timestamps null: false
    end
  end
end
