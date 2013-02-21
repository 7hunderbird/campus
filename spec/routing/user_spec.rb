require 'spec_helper'

describe UsersController, 'routing' do
  it 'to #index' do
    expect(:get => '/users').to route_to('users#index')
  end
end
