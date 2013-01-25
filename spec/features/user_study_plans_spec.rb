require 'spec_helper'

describe "User Study Plans" do
  let(:user) { create(:user, email: 'test@example.com') }
  let!(:sp) { create(:study_plan, name: 'BDD with Cucumber') }
  let!(:spu) { create(:study_plan_with_user, name: 'Testing with Capybara', user: user) }

  before do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

  it "lists study plans for a user" do
    visit user_study_plans_path(user)
    
    expect( page ).to have_content spu.name
    expect( page ).to_not have_content sp.name
  end
end

