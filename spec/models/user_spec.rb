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

  it { should respond_to(:feed) }
  it { should respond_to(:relationships) }
end
