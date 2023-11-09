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

  def destroy
    reset_session
    flash[:sucess] = "You have been successful logged out"
    redirect_to '/'
  end

  def create_github
    client_id = Rails.application.credentials.github[:client_id]
    client_secret = Rails.application.credentials.github[:client_secret]
    code = params[:code]

    conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})

    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
          'Authorization': "token #{access_token}"
      }
    )

    response = conn.get('/user')
    data = response.body
    binding.pry

    conn = Faraday.new(url: Rails.application.config.conn_url, headers: {'Accept': 'application/json'})

    response = conn.post('/api/v1/sessions/github_create') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = data
    end
    response


  end
end