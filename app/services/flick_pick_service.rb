class FlickPickService < ApplicationService
  def conn
    # require 'pry';binding.pry
    Faraday.new(url: Rails.application.config.conn_url) 
  end

  def users_show(id)
    json_parse(conn.get("/api/v1/users/#{id}"))
  end

  def create_user(user_data)
    response = conn.post('/api/v1/users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { user: user_data }.to_json
    end
    response
  end

  def users_update(user_id, body)
    conn.post("/api/v1/users/#{user_id}", body)
  end

  def parties_show(id)
    json_parse(conn.get("/api/v1/parties/#{id}"))
  end

  def basic_session(user_data)
    response = conn.post('/api/v1/sessions') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = user_data 
    end
    response
  end
  
  def create_party(party_data)
    response = conn.post('/api/v1/parties') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { party: party_data }.to_json
    end
    response
  end

  def oauth_verification(user_data)
    # require 'pry'; binding.pry
    response = conn.get("/api/v1/users/omniauth") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { user: user_data }.to_json
    end
    response
  end
end