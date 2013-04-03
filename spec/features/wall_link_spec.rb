require 'spec_helper'

describe "The link to Wall" do
  let(:user) { create(:user, email: 'test@example.com') }

  context 'when user is signed in' do
    it "has a link for Wall" do
      # sign in so you have a current_user
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_button "Sign in"

      visit root_path

      expect( page ).to     have_content 'Wall'
      click_on 'Wall'
      expect( page ).to     have_content 'Wall Page'
    end
  end
  
  # context uses when or with
  context 'when user is not signed in' do
    it "link to my wall does not display" do
      visit root_path

      expect( page ).to_not have_content 'Wall'
    end
  end
end

