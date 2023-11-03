class UsersController < ApplicationController
  def show 
    @user = UserFacade.search_user(params[:id])
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
      render :new
    end
  end
end