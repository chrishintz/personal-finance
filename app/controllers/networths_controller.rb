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
    @user = User.find(session[:user_id])
    @net_worth = NetWorth.find_or_create_by(user_id: @user.id)
    if @net_worth.new_record?
      @net_worth.user_id = @current_user.id
      @net_worth.save
    else
      @net_worth.update(networth_params)
    end
    render_wizard @net_worth
  end

  def assets
    @user = User.find(session[:user_id])
    @assets = @user.net_worth.sum_assets
    render json: @assets
  end

  def liabilities
    @user = User.find(session[:user_id])
    @liabilities = @user.net_worth.sum_liabilities
    render json: @liabilities
  end

  def networth_calc
    @user = User.find(session[:user_id])
    @assets = @user.net_worth.sum_assets
    @liabilities = @user.net_worth.sum_liabilities
    @networth = @assets + @liabilities
    render json: @networth
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

  def finish_wizard_path
    dashboard_path
  end
end
