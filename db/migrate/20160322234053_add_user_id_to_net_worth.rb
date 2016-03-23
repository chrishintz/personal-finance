class AddUserIdToNetWorth < ActiveRecord::Migration
  def change
    add_column :net_worths, :user_id, :integer
  end
end
