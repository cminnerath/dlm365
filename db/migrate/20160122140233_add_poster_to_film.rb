class AddPosterToFilm < ActiveRecord::Migration
  def change
    add_attachment :films, :poster
  end
end
