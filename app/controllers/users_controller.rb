class UsersController < ApplicationController
  include Wicked::Wizard
  skip_before_filter :setup_wizard, only: :dashboard
  steps :signup, :biographical, :spouse, :other

  def index
  end

  def show
    case step
    when :signup
      @user = User.new
    else
      @user = User.find(session[:user_id])
    end
    render_wizard
  end

  def update
    case step
    when :signup
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
    else
      @user = User.find(session[:user_id])
      @user.update(user_params)
    end
      params[:user][:status] = 'active' if step == steps.last
      render_wizard @user
      # flash.now.alert = "Username or Email is already taken"
  end

  def dashboard
    # @users = User.all
    @user = User.find(session[:user_id])
    @networths = NetWorth.all
  end

  private
    def user_params
      params.require(:user).permit( :username,
                                    :email,
                                    :password,
                                    :password_confirmation,
                                    :first_name,
                                    :last_name,
                                    :dob,
                                    :income,
                                    :married,
                                    :spouse_first_name,
                                    :spouse_last_name,
                                    :spouse_income,
                                    :spouse_dob,
                                    :other_income,
                                    :status
                                    )
    end

    def finish_wizard_path
      networths_start_path
    end
end
