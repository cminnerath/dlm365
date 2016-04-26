class AddMiniToFilms < ActiveRecord::Migration
  def change
    add_reference :films, :mini, index: true, foreign_key: true
  end
end
