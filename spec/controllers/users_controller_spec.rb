require 'spec_helper'

describe UsersController do
  login_user

  describe 'GET index' do
    it 'assigns all uses to @users' do
      get :index
      expect(assigns['users']).to eq(User.all)
    end
  end
end
