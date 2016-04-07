class CreateJoinTableMinisFilms < ActiveRecord::Migration
  def change
    create_join_table :minis, :films do |t|
      t.index [:mini_id, :film_id]
      t.index [:film_id, :mini_id]
    end
  end
end
