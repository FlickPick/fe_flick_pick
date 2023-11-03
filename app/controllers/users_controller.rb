class UsersController < ApplicationController
  def show 
    # @user = UserFacade.search_user(params[:id])
    # if admin?
    if current_user
      @user = UserFacade.search_user(@_current_user&.id)
    else
      flash[:error] = "Please log in"
      redirect_to new_session_path
    end
  end

  def new
  end

  def create
    @user_facade = UserFacade.new
    response = @user_facade.create_user(params)
    if response.status == 201
      response_data = JSON.parse(response.body)
      user_id = response_data["data"]["id"]
      flash[:success] = "User created successfully"
      redirect_to "/users/#{user_id}"
    else
      flash[:error] = "Error creating user"
      render new_user_path
    end
  end
end