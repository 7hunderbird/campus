require 'spec_helper'

describe HomeworksController do

  # every controller action is locked down by Devise, to get around this in specs
  # we use a macro (spec/support/controller_macros.rb) that logs in as a user 
  login_user

  # by convention, when describing an instance method use '#', and '.' for a class
  # method
  describe "PUT #complete" do
    before do
      # Homework.new.save returned the value "true" - a boolean, not a Homework
      # object
      @homework = Homework.create
    end

    it "assigns @homework" do
      put :complete, id: @homework
      expect(assigns :homework).to eq @homework
    end
  end
=begin
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
=end
end
