class AddSerializationToFilms < ActiveRecord::Migration
  def change
    add_column :films, :actors, :text
    add_column :films, :directors, :text
    add_column :films, :writers, :text
    add_column :films, :genres, :text
  end
end
