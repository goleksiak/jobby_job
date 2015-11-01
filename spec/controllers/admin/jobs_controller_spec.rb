require 'rails_helper'

RSpec.describe Admin::JobsController, type: :controller do

  before { sign_in }

  describe 'GET #index' do

    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do

    before { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do

    context 'success' do

      let(:params) { { job: attributes_for(:job) } }

      before { get :create, params }

      it 'returns http found' do
        expect(response).to have_http_status(:found)
      end

      it 'should persist a Job' do
        expect(assigns(:job)).to be_persisted
      end
    end

    context 'failure' do

      let(:params) { { job: attributes_for(:job).except(:title) } }

      before { get :create, params }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'should not persist a Job' do
        expect(assigns(:job)).to_not be_persisted
      end

      it 'renders the :new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do

    let(:job) { create :job }

    before { get :edit, id: job.id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #update' do

    let(:job) { create :job }

    context 'success' do

      let(:params) { { id: job.id, job: { title: 'Updated title' } } }

      before { put :update, params }

      it 'returns http found' do
        expect(response).to have_http_status(:found)
      end

      it 'should update the Job' do
        expect(assigns(:job).title).to eq('Updated title')
      end
    end
  end
end
