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

  def create_temp_user(temp_user_data)
    response = conn.post('/api/v1/temp_users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { temp_user: temp_user_data }.to_json
    end
    response
  end

  def temp_users(party_id)
    response = conn.get('/api/v1/temp_users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { party_id: party_id }.to_json
    end
    json_parse(response)
  end

  def movies(round, party_id)
    response = conn.get('/api/v1/movies') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = {round: round, party_id: party_id }.to_json
    end
    json_parse(response)
  end
end