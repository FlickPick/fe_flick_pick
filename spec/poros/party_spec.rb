require "rails_helper"

RSpec.describe Party do 
  it "exists" do 
    attributes = {
      id: "1", 
      access_code: "1234", 
      max_rating: "2", 
      max_duration: "60", 
      services: "Hulu", 
      movie_id: "550"
    }

    party = Party.new(attributes)
    expect(party.id).to eq("1")
    expect(party.access_code).to eq("1234")
    expect(party.max_rating).to eq("2")
    expect(party.max_duration).to eq("60")
    expect(party.services).to eq("Hulu")
    expect(party.movie_id).to eq("550")
  end
end