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
      flash[:success] = "User created successfully"
      redirect_to "/"
    else
      flash[:error] = "Error creating user"
      render :new
    end
  end
end