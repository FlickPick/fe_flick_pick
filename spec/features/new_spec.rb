require "rails_helper"

RSpec.feature "User Registration", type: :feature do
  it "User can register a new account", :vcr do
    visit "/users/new"

    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "johndoe@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Create New User"
    
    expect(current_path).to eq("/")
  end
end