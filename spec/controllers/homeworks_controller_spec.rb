require 'spec_helper'

describe HomeworksController do

  describe "PUT 'complete'" do
    before do
      @homework = Homework.new.save
    end
    it "returns http success" do
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
