class SessionFacade 

  def basic_session(params)
    user_data = {
      email: params[:email], 
      password: params[:password]
    }.to_json
    
    FlickPickService.new
                    .basic_session(user_data)
  end
end