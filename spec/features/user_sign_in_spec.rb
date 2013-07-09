require 'spec_helper'

describe "User Sign In" do
  before :each do
    @user = FactoryGirl.create(:user, email: 'test@example.com')
  end

  it "signs in registered users" do
    visit new_user_session_path
    # expect(page).to have_content "foobar"
    # expect(current_path).to eq '/'

    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    # save_and_open_page
    click_button "Sign In"

    expect(page).to have_content "Signed in successfully"
  end

  it "does not sign in un-registered users" do
    visit new_user_session_path
    click_button "Sign In"

    expect(page).to have_content "Invalid email or password."
  end

  it "redirects to welcome page" do
    visit new_user_session_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_button "Sign In"

    expect(current_path).to eq welcome_path
    expect(page).to have_content "Welcome"

  end
end
