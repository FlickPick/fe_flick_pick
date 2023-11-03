require 'rails_helper'

RSpec.describe "Logging In Session" do
  it "can log in with valid credentials", :vcr do
    visit new_user_path

    click_on "Create New User"

    expect(current_path).to eq(users_path)

    fill_in :user_email, with: @user.email
    fill_in :user_password, with: @user.password

    VCR.use_cassette("login_with_valid_credentials") do
      click_on "Log in"
    end

    expect(current_path).to eq("/users/3")

    expect(page).to have_content("Welcome, #{@user.email}")
  end
end