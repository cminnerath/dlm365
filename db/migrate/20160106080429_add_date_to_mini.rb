class AddDateToMini < ActiveRecord::Migration
  def change
    add_column :minis, :date_viewed, :date
  end
end
