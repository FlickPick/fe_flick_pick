require "rails_helper"

RSpec.describe UserFacade do 
  describe "instance methods" do 
    it "returns a single user" do 
      results = UserFacade.search_user("1")
    end
  end
end