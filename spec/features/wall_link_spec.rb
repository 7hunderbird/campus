require 'spec_helper'

describe "The link to Wall" do
  let(:user) { create(:user, email: 'test@example.com') }

  context 'when user is signed in' do
    before do
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    it "has a link for Wall" do
      expect( page ).to have_content 'Wall'
      click_on 'Wall'
      expect( page ).to have_content 'view my profile'
    end

    it "view followers"
    it "view following"
  end
  
  context 'when user is not signed in' do
    it "link to my wall does not display" do
      visit root_path
      expect( page ).to_not have_content 'Wall'
    end
  end

  # describe "Page" do
  #   describe "for signed-in users" do
  #     let(:user) { FactoryGirl.create(:user) }
  #     let(:user) { create(:user) }

  #     before do
  #       FactoryGirl.create(:study_plan, user: user, name: "Lorem")
  #       sp = FactoryGirl.create(:study_plan_with_user)
  #       user = sp.user
  #       # sign_in user
  #       login_user
  #       visit root_path
  #     end

  #     it "should render the user's feed" do
  #       user.feed.each do |item|
  #         page.should have_selector("li##{item.id}", text: item.content)
  #       end
  #     end

  #     describe "follower/following counts" do
  #       let(:other_user) { FactoryGirl.create(:user) }
  #       before do
  #         other_user.follow!(user)
  #         visit root_path
  #       end

  #       it { should have_link("0 following", href: following_user_path(user)) }
  #       it { should have_link("1 followers", href: followers_user_path(user)) }
  #     end
  #   end
  # end
end

