class UsersController < ApplicationController
  include Wicked::Wizard
  steps :signup, :biographical, :spouse, :other

  def index
  end

  def show
    @user = User.new
    render_wizard
  end
end
