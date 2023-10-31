class FlickPickService < ApplicationService
  def conn
    Faraday.new(url: 'http://localhost:3000') 
  end

  def users_show(id)
    json_parse(conn.get("/api/v1/users/#{id}")
  end

  def users_create(body)
    conn.post("/api/v1/users/new", body)

  def users_update(user_id, body)
    conn.post("/api/v1/users/#{user_id}", body)
  end

end