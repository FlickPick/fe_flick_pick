class FlickPickService < ApplicationService
  def conn
    Faraday.new(url: 'http://localhost:3000') 
  end

  def users_show(id)
    json_parse(conn.get("/api/v1/users/#{id}")
  end

  def users_create(user_data)
    conn.post("/api/v1/users/") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = JSON.generate(user_data)
    end
  end

  def users_update
    conn.patch("/api/v1/users/#{user_id}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = JSON.generate(user_data)
    end
  end


  

end