require "rails_helper"

RSpec.describe UserFacade do 
  describe "instance methods" do 
    it "returns a single user", :vcr do 
      result = UserFacade.search_user("1")

      expect(result.id).to be_a(String)
      expect(result.name).to be_a(String)
      expect(result.email).to be_a(String)
      expect(result.movie_history).to be_a(String)
      expect(result.role).to be_a(Integer)
    end
  end
end