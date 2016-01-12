class AddColumnsToFilms < ActiveRecord::Migration
  def change
    add_column :films, :release_date, :string
    add_column :films, :runtime, :string
    add_column :films, :poster_url, :string
  end
end
