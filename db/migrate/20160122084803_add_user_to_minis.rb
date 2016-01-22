class AddUserToMinis < ActiveRecord::Migration
  def change
    add_reference :minis, :user, index: true
  end
end
