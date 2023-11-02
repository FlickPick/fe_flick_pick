class UsersController < ApplicationController
  def show 
    @user = UserFacade.search_user(params[:id])
  end
end