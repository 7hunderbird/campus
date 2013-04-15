require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "Wall page" do
    let(:user) { create(:user, email: 'test@example.com') }

    context "for signed-in users" do
      pending "should render the user's feed"
      # before do
      #   FactoryGirl.create(:study_plan, user: user, name: "Lorem ipsum")
      #   FactoryGirl.create(:study_plan, user: user, name: "Dolor sit amet")
      #   # sign_in user
      #   visit new_user_session_path
      #   fill_in "Email", with: user.email
      #   fill_in "Password", with: user.password
      #   click_button "Sign in"
      #   visit root_path
      # end

      # it "should render the user's feed" do
      #   user.feed.each do |item|
      #     page.should have_selector("li##{item.id}", text: item.name)
      #   end
      # end
    end
  end
end
