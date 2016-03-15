class AddSpouseDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :spouse_dob, :string
  end
end
