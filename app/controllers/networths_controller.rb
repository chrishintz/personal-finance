class NetworthsController < ApplicationController
  include Wicked::Wizard
  steps :bank, :retirement, :equities, :physical_assets, :other_assets,
        :physical_liabilities, :installment_debt, :other_liabilities

  def index
  end

  def show
    @net_worth = NetWorth.new
    render_wizard
  end

  def update
    @net_worth = NetWorth.new(networth_params)
    render_wizard @net_worth
  end

  private

  def networth_params
    params.require(:net_worth).permit(:checking_account,
                                      :savings_account,
                                      :four_o_one_k,
                                      :roth_ira,
                                      :other_iras,
                                      :five_twenty_nine,
                                      :stocks,
                                      :bonds,
                                      :other_investments,
                                      :pension,
                                      :primary_residence,
                                      :other_real_estate,
                                      :car,
                                      :life_insurance,
                                      :other_assets,
                                      :real_estate_mortgages,
                                      :student_loans,
                                      :car_loans,
                                      :credit_card_debt,
                                      :consumer_loans,
                                      :unpaid_taxes,
                                      :money_owned_to_others,
                                      :other_liabilities
                                      )
  end
end
