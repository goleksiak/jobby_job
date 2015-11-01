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

      before { get :create, valid_job_params }

      it 'returns http found' do
        expect(response).to have_http_status(:found)
      end

      it 'should persist a Job' do
        expect(assigns(:job)).to be_persisted
      end
    end

    context 'failure' do

      before { get :create, invalid_job_params }

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

  def invalid_job_params
    {
      job: attributes_for(:job).except(:title)
    }
  end

  def valid_job_params
    {
      job: attributes_for(:job)
    }
  end
end
