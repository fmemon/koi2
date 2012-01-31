class UsersController < ApplicationController
	before_filter :authenticate_user!
	
  include UsersHelper

  def index
  end

  def show
    @user = User.find(params[:id])
  end
end
