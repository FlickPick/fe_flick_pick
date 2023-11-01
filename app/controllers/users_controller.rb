class UsersController < ApplicationController
  def new
  end
  
  def create
    FlickPickFacade.new.users_create(user_data)
  end

private

  def user_data
    {user: {name: params[:name],
            email: params[:email],
            role: params[:role],
            password: params[:password],
            }}
  end

end
