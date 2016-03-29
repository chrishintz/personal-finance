class ChangingSpouseDob < ActiveRecord::Migration
  def change
    remove_column :users, :spouse_dob
    add_column :users, :spouse_dob, :date
  end
end
