class UsersController < ApplicationController
  include Wicked::Wizard
  steps :signup, :biographical, :spouse, :other

  def index
  end

  def show
    render_wizard
  end
end
