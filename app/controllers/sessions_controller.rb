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

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid? 
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    flash[:sucess] = "You have been successful logged out"
    redirect_to '/'
  end
end