class SessionsController < ApplicationController
  def new
  end

  def create
    response = SessionFacade.new
                            .basic_session(params)
    if response.status == 201
      id = JSON.parse(response.body, symbolize_names: true)[:id]
      session[:user_id] = id
      flash[:success] = "Logged in"
      redirect_to "/users/#{id}"
    else
      flash[:error] = "Your credentials are not valid please try again"
      render :new
    end
  end

#   def omniauth
#     if request.env["omniauth.auth"]["info"]["email_verified"] == true
#       response = UserFacade.new.oauth_verification(request.env["omniauth.auth"]["info"]["email"])
# require 'pry'; binding.pry
#       if response[:status] == 201
#         session[:user_id] = response[:user_id]
#         redirect_to user_path(user)
#       else
#         redirect_to new_user_path
#       end
#     end
#   end

  def omniauth
    response = FlickPickService.new.oauth_verification(request.env['omniauth.auth'])
    if response.status == 201
      id = JSON.parse(response.body, symbolize_names: true)[:data][:id]
      session[:user_id] = id
      flash[:success] = "Logged in"
      redirect_to user_path(id)
    elsif response.status == 202
      id = JSON.parse(response.body, symbolize_names: true)[:data][0][:id]
      session[:user_id] = id
      flash[:success] = "Logged in"
      redirect_to user_path(id)
    else
      redirect_to new_user_path
    end
  end

  def destroy
    reset_session
    flash[:sucess] = "You have been successful logged out"
    redirect_to '/'
  end
end