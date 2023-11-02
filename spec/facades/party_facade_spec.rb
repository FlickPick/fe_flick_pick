require "rails_helper"

RSpec.describe PartyFacade do 
  describe "instance methods" do 
    it "returns a single party", :vcr do 
      result = PartyFacade.search_party("1")
      expect(result.id).to be_a(String)
      expect(result.access_code).to be_a(String)
      expect(result.max_rating).to be_a(Integer)
      expect(result.max_duration).to be_a(Integer)
      expect(result.genres).to be_a(String)
      expect(result.languages).to be_a(String)
      expect(result.format).to be_a(Integer)
      expect(result.movie_id).to be_a(Integer)
    end
  end
end