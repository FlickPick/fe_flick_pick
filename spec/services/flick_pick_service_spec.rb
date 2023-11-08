require "rails_helper"

RSpec.describe FlickPickService do
  it "users_show; can pull individual user data down", :vcr do
    json_data = File.read("spec/fixtures/user.json")
    stub_request(:get, "http://localhost:5000/users/1").
    to_return(status: 200, body: json_data, headers: {})

    search = FlickPickService.new.users_show(1)
    expect(search).to be_a Hash
    expect(search[:data]).to be_a Hash
    user_data = search[:data]

    attributes = user_data[:attributes]
    expect(attributes).to have_key(:name)
    expect(attributes[:name]).to be_a(String)

    expect(user_data).to have_key(:id)
    expect(user_data[:id]).to be_a(String)
    expect(user_data).to have_key(:type)
    expect(user_data[:type]).to be_a(String)

    expect(attributes[:name]).to be_a(String)
    expect(attributes[:email]).to be_a(String)
    expect(attributes[:role]).to be_a(Integer)
  end

  it "parties_show; can pull individual party data down", :vcr do 
    json_data = File.read("spec/fixtures/party.json")
    stub_request(:get, "http://localhost:5000/parties/1").
    to_return(status: 200, body: json_data, headers: {})

    search = FlickPickService.new.parties_show(1)
    expect(search).to be_a Hash
    expect(search[:data]).to be_a Hash
    party_data = search[:data]

    attributes = party_data[:attributes]

    expect(party_data).to have_key(:id)
    expect(party_data[:id]).to be_a(String)
    expect(party_data).to have_key(:type)
    expect(party_data[:type]).to be_a(String)

    expect(attributes[:access_code]).to be_a(String)
    expect(attributes[:max_rating]).to be_a(String)
    expect(attributes[:max_duration]).to be_a(Integer)
    expect(attributes[:genres]).to be_a(String)
    expect(attributes[:services]).to be_a(String)
    expect(attributes[:movie_id]).to be_a(Integer)
  end

  it "create_user; should send 201 response back" do 
    user_data = {
      name: "John",
      email: "john@example.com",
      role: "1",
      language_pref: "1",
      password_digest: "123"
    }

    conn = double("Faraday")
    allow(Faraday).to receive(:new).and_return(conn)
    response = double("Response", status: 201)
    allow(conn).to receive(:post).and_return(response)

    user_service = FlickPickService.new
    response = user_service.create_user(user_data)

    expect(response.status).to eq(201)
  end

  it "create_party; should send 201 response back" do 
    party_data = {
      access_code: "ABC123",
      max_rating: "5",
      max_duration: "120",
      genres: "Action, Comedy",
      services: "Netflix, Hulu",
      movie_id: "1"
    }

    conn = double("Faraday")
    allow(Faraday).to receive(:new).and_return(conn)
    response = double("Response", status: 201)
    allow(conn).to receive(:post).and_return(response)

    user_service = FlickPickService.new
    response = user_service.create_party(party_data)

    expect(response.status).to eq(201)
  end

  it "users_update; can update a user" do
    json_data = File.read("spec/fixtures/user.json")
    user_id = 1

    response = double("Response", status: 200, body: json_data)

    conn = double("Faraday")
    allow(Faraday).to receive(:new).and_return(conn)
    allow(conn).to receive(:post) do |url, body, headers|
      expect(url).to eq("/api/v1/users/#{user_id}")
      response
    end

    user_data = {
      name: "Updated Name",
      email: "updated@example.com",
      role: 2,
      password_digest: "updated_password"
    }

    user_service = FlickPickService.new
    response = user_service.users_update(user_id, user_data)

    expect(response.status).to eq(200)
    expect(response.body).to eq(json_data)
  end

  it "create_party; should send 201 response back", :vcr do
    party_data = {
      access_code: "ABC123",
      max_rating: "5",
      max_duration: 120,
      genres: "Action, Comedy",
      services: "Netflix, Hulu",
      movie_id: 1
    }

    response = double("Response", status: 201)

    conn = double("Faraday")
    allow(Faraday).to receive(:new).and_return(conn)
    allow(conn).to receive(:post).and_return(response)

    user_service = FlickPickService.new
    response = user_service.create_party(party_data)

    expect(response.status).to eq(201)
  end

  it "movie; should return the movie based on its id", :vcr do 
    stub_request(:get, "/api/v1/movies/550").to_return(status: 200, body: '{"title": "Example Movie"}')

    movie_data = FlickPickService.new.movie(550)

    expect(movie_data[:data][:attributes][:title]).to eq("Fight Club")
  end

  it "create_temp_user; should create a temporary user", :vcr do 
    temp_user_data = {
      name: "User",
      party_id: "2"
    }

    conn = double("Faraday")
    allow(Faraday).to receive(:new).and_return(conn)
    response = double("Response", status: 201)
    allow(conn).to receive(:post).and_return(response)

    user_service = FlickPickService.new
    response = user_service.create_temp_user(temp_user_data)

    expect(response.status).to eq(201)
  end
end