require 'spec_helper'

describe 'routing to users' do
  it 'routes /users to users#index' do
    expect(:get => '/users').to route_to(
      :controller => 'users',
      :action => 'index'
    )
  end
end
