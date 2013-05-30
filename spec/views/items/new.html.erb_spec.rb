require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path, :method => "post" do
    end
  end
end
