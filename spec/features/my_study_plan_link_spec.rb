require 'spec_helper'

# add a title for the feature
describe "The link to My Study Plans" do
  let(:user) { create(:user, email: 'test@example.com') }
  let!(:sp) { create(:study_plan, name: 'BDD with Cucumber') }
  let!(:spu) { create(:study_plan_with_user, name: 'Testing with Capybara', user: user) }

  # TODO: SPEC Wire up the new UI for My Study Plans when signed in.
  # context 'when user is signed in' do
  #   it "displays a list of only my study plans" do
  #     # sign in so you have a current_user
  #     visit new_user_session_path
  #     fill_in "email", with: user.email
  #     fill_in "password", with: user.password

  #     click_button "Sign In"

  #     visit root_path

  #     expect( page ).to     have_content 'My Study Plans'
  #     click_on 'My Study Plans'
  #     expect( page ).to     have_content spu.name
  #     expect( page ).to_not have_content sp.name
  #   end
  # end
  
  # context uses when or with
  context 'when user is not signed in' do
    it "link to my study plan does not display" do
      visit root_path

      expect( page ).to_not have_content 'My Study Plans'
    end
  end
end

