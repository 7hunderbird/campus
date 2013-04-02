require 'spec_helper'

describe HomeworksController do

  login_user

  describe "PUT #complete" do
    before do
      @homeowrk = create :homework
    end

    it "assigns @homework" do
      put :complete, id: @homework
      expect(assigns :homework).to eq @homework
    end
  end

  describe "GET '#index'" do
    before do
      @homeowrk = create :homework
    end
    it "assigns @homeworks" do
      get 'index'
      expect(assigns :homework).to eq @homeworks
    end
  end

end
