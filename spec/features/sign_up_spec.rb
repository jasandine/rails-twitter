require "rails_helper"

describe "the add a user process" do
  it "adds a new user" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation
    click_on "Sign up"
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
