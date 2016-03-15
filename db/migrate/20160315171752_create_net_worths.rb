class CreateNetWorths < ActiveRecord::Migration
  def change
    create_table :net_worths do |t|
      t.integer :checking_account
      t.integer :savings_account
      t.integer :four_o_one_k
      t.integer :roth_ira
      t.integer :other_iras
      t.integer :five_twenty_nine
      t.integer :stocks
      t.integer :bonds
      t.integer :other_investments
      t.integer :pension
      t.integer :primary_residence
      t.integer :other_real_estate
      t.integer :car
      t.integer :life_insurance
      t.integer :other_assets
      t.integer :real_estate_mortgages
      t.integer :student_loans
      t.integer :car_loans
      t.integer :credit_card_debt
      t.integer :consumer_loans
      t.integer :unpaid_taxes
      t.integer :money_owned_to_others
      t.integer :other_liabilities

      t.timestamps null: false
    end
  end
end
