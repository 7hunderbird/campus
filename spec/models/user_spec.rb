require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  # devise validated attrs
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should have_many(:study_plans) }

  it { should respond_to(:study_plans) }
  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }

  describe "following" do
    let(:other_user) { FactoryGirl.create(:user) }    
    before do
      @user.save
      @user.follow!(other_user)
    end

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(@user) }
    end

    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end

  describe "study plans associations" do

    before { @user.save }
    let!(:older_study_plan) do 
      FactoryGirl.create(:study_plan, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_study_plan) do
      FactoryGirl.create(:study_plan, user: @user, created_at: 1.hour.ago)
    end

    describe "status" do
      let(:unfollowed_post) do
        FactoryGirl.create(:study_plan, user: FactoryGirl.create(:user))
      end

      its(:feed) { should include(newer_study_plan) }
      its(:feed) { should include(older_study_plan) }
      its(:feed) { should_not include(unfollowed_post) }
    end
  end
end
