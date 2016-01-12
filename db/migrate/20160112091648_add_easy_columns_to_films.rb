class AddEasyColumnsToFilms < ActiveRecord::Migration
  def change
    add_column :films, :tagline, :text
    add_column :films, :plot, :text
    add_column :films, :certification, :string
    add_column :films, :rating, :float
  end
end
