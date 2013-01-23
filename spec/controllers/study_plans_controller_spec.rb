require 'spec_helper'

describe StudyPlansController do

  login_user

  let!(:study_plan) { create(:study_plan) }

  describe 'GET #index' do
    before { get :index }

    it 'assigns an array of study_plans' do
      expect(assigns :study_plans).to eq [study_plan]
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, id: study_plan }

    it 'assigns @study_plan' do
      expect(assigns :study_plan).to eq study_plan
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new StudyPlan to @study_plan' do
      expect(assigns :study_plan).to be_a_new StudyPlan
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: study_plan }

    it 'assigns @study_plan' do
      expect(assigns :study_plan).to eq study_plan
    end
    it 'renders the :new template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new StudyPlan' do
        expect {
          post :create, study_plan: attributes_for(:study_plan)
        }.to change { StudyPlan.count }.by(1)
      end

      it 'assigns @study_plan' do
        post :create, study_plan: attributes_for(:study_plan, name: 'Created')
        expect(assigns :study_plan).to_not be nil
      end

      it 'redirects to the study_plan' do
        post :create, attributes_for(:study_plan)
        expect(response).to be_success
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new StudyPlan' do
        expect {
          post :create, study_plan: attributes_for(:invalid_study_plan)
        }.to_not change { StudyPlan.count }
      end

      it 're-renders the :new template' do
        post :create, study_plan: attributes_for(:invalid_study_plan)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'assigns @study_plan'do
        put :update, id: study_plan, study_plan: attributes_for(:study_plan)
        expect(assigns :study_plan).to eq study_plan
      end

      it 'updates the study_plan' do
        put :update, id: study_plan, study_plan: attributes_for(:study_plan, name: 'Updated')
        study_plan.reload
        expect(study_plan.name).to eq 'Updated'
      end

      it 'redirects to the study_plan' do
        put :update, id: study_plan, study_plan: attributes_for(:study_plan)
        expect(response).to redirect_to study_plan
      end
    end
    
    context 'with invalid attributes' do
      it 'does not change @study_plan' do
        put :update, id: study_plan, study_plan: attributes_for(:invalid_study_plan)
        expect(assigns :study_plan).to eq study_plan
      end

      it 're-renders edit template' do
        put :update, id: study_plan, study_plan: attributes_for(:invalid_study_plan)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the study_plan' do
      expect {
        delete :destroy, id: study_plan  
      }.to change { StudyPlan.count }.by(-1)
    end

    it 'redirects to study_plan list' do
      delete :destroy, id: study_plan
      expect(response).to redirect_to study_plans_url
    end
  end
end
