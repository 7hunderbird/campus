require 'spec_helper'

describe User do
  # devise validated attrs
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should have_many(:study_plans) }
end
