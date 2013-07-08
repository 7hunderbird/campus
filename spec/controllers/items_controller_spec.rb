require 'spec_helper'

describe ItemsController do

  login_user

  let!(:items) {create(:item)}

  describe 'GET #index' do
    before { get :index }

    # it 'assigns an array of study_plans' do
    #   expect(assigns :study_plans).to eq [study_plan]
    # end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end
end
