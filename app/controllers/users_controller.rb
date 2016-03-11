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
    @user = User.new(user_params)
    session[:user_id] = @user.id
    render_wizard @user
    #   flash.now.alert = "Username or Email is already taken"  
  end

  private
    def user_params
      params.require(:user).permit( :username,
                                    :email,
                                    :password,
                                    :password_confirmation,
                                    :first_name,
                                    :last_name)
    end
end
