require "rails_helper"

RSpec.describe User do 
  it "exists" do 
    attributes = {
      id: "1", 
      name: "User", 
      email: "useremail", 
      role: "2", 
      language_pref: "3", 
      movie_history: "movie"
    }

    user = User.new(attributes)
    expect(user.id).to eq("1")
    expect(user.name).to eq("User")
    expect(user.email).to eq("useremail")
    expect(user.role).to eq("2")
    expect(user.language_pref).to eq("3")
    expect(user.movie_history).to eq("movie")
  end
end