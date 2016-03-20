class UsersController < ApplicationController
  include Wicked::Wizard
  steps :signup, :biographical, :spouse, :other

  def index
  end

  def show
    @user = User.new
    render_wizard
  end

  def update
    # case signup
      @user = User.new(user_params)
      session[:user_id] = @user.id
      render_wizard @user
      # flash.now.alert = "Username or Email is already taken"
  end

  def dashboard
    @user = User.find(session[:user_id])
  end

  private
    def user_params
      params.require(:user).permit( :username,
                                    :email,
                                    :password_digest,
                                    :first_name,
                                    :last_name)
    end

    def finish_wizard_path
      networths_start_path
    end
end
