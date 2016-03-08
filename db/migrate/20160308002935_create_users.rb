class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :email
      t.date :dob
      t.boolean :married
      t.integer :income
      t.string :spouse_first_name
      t.string :spouse_last_name
      t.integer :spouse_income
      t.integer :other_income

      t.timestamps null: false
    end
  end
end
