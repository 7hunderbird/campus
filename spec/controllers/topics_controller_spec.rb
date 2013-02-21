require 'spec_helper'

describe TopicsController do

  login_user

  let!(:topic) { create(:topic) }

  describe 'GET #index' do
    before { get :index }

    it 'assigns an array of topics' do
      expect(assigns :topics).to eq [topic]
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, id: topic }

    it 'assigns @topic' do
      expect(assigns :topic).to eq topic
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Topic to @topic' do
      expect(assigns :topic).to be_a_new Topic
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: topic }

    it 'assigns @topic' do
      expect(assigns :topic).to eq topic
    end
    it 'renders the :new template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Topic' do
        expect {
          post :create, topic: attributes_for(:topic)
        }.to change { Topic.count }.by(1)
      end

      it 'assigns @topic' do
        post :create, topic: attributes_for(:topic, title: 'Created')
        expect(assigns :topic).to_not be nil
      end

      it 'redirects to the topic' do
        post :create, attributes_for(:topic)
        expect(response).to be_redirect
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new Topic'
      it 're-renders the :new template'
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'assigns @topic' do
        put :update, id: topic, topic: attributes_for(:topic)
        expect(assigns :topic).to eq topic
      end

      it 'updates the topic' do
        put :update, id: topic, topic: attributes_for(:topic, title: 'Updated')
        topic.reload
        expect(topic.title).to eq 'Updated'
      end

      it 'redirects to the topic' do
        put :update, id: topic, topic: attributes_for(:topic)
        expect(response).to redirect_to topic
      end
    end
    
    context 'with invalid attributes' do
      it 'does not change @topic'
      it 're-renders edit template'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the topic' do
      expect {
        delete :destroy, id: topic  
      }.to change { Topic.count }.by(-1)
    end

    it 'redirects to topic list' do
      delete :destroy, id: topic
      expect(response).to redirect_to topics_url
    end
  end
end
