class CreateNetWorthProgresses < ActiveRecord::Migration
  def change
    create_table :net_worth_progresses do |t|
      t.integer :assets
      t.integer :liabilities
      t.integer :networth
      t.datetime :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
