require "rails_helper"

RSpec.describe User do 
  it "exists" do 
    attributes = {
      id: "1", 
      name: "User", 
      email: "useremail"
    }

    user = User.new(attributes)
    expect(user.id).to eq("1")
    expect(user.name).to eq("User")
    expect(user.email).to eq("useremail")
  end
end