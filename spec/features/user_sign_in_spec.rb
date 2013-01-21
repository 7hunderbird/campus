require 'spec_helper'

describe "User sign in" do
  before :each do
    @user = FactoryGirl.create(:user, email: 'test@example.com')
  end

  it "registered user is valid" do
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Sign in"

    expect(page).to have_content "Signed in successfully"
  end

  it "un-registered user is invalid" do
    visit new_user_session_path
    click_button "Sign in"

    expect(page).to have_content "Invalid email or password."
  end
end
