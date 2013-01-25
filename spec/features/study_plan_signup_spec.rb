require 'spec_helper'

describe "Study Plan Sign-up" do
  let(:user) { create(:user, email: 'test@example.com') }
  let(:study_plan) { create(:study_plan) }

  before :each do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

  it "signs up for a study plan" do
    # nested routes
    visit study_plan_path(study_plan)
    
    # show template
    click_link "Sign up"
    
    # relationships, and the #update if statement
    expect( study_plan.reload.user ).to eq(user)

    expect(page).to have_content "Study plan was successfully updated"
  end
end
