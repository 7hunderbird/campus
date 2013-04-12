require 'spec_helper'

describe UsersController do
  login_user

  describe 'GET #index' do
    it 'assigns all uses to @users' do
      get :index
      expect(assigns['users']).to eq(User.all)
    end
  end

  describe "GET #wall" do
    it "responds success" do
      get :wall
      expect(response).to be_success
    end
  end
end
