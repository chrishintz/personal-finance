class NetWorth < ActiveRecord::Base
  belongs_to :user
  before_save :make_negative

  def make_negative
    self.real_estate_mortgages  = -real_estate_mortgages.abs
    self.student_loans          = -student_loans.abs
    self.car_loans              = -car_loans.abs
    self.credit_card_debt       = -credit_card_debt.abs
    self.consumer_loans         = -consumer_loans.abs
    self.unpaid_taxes           = -unpaid_taxes.abs
    self.money_owned_to_others  = -money_owned_to_others.abs
    self.other_liabilities      = -other_liabilities.abs
  end
end
