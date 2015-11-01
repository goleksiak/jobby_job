require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do

  describe 'GET #new' do

    context 'success' do

      let(:job) { create :job }

      before { get :new, job_id: job.id }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'failure' do

      context 'params[:job_id] not present' do

        before { get :new }

        it 'should redirect to the root path' do
          expect(subject).to redirect_to(root_path)
        end
      end
    end
  end

  describe 'POST #create' do

    context 'success' do

      let(:params) { { submission: attributes_for(:submission_with_job) } }

      before { post :create, params }

      it 'returns http found' do
        expect(response).to have_http_status(:found)
      end

      it 'should persist a Submission' do
        expect(assigns(:submission)).to be_persisted
      end
    end

    context 'failure' do

      let(:params) { { submission: attributes_for(:submission_with_job).except(:name) } }

      before { post :create, params }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the :new template' do
        expect(response).to render_template(:new)
      end

      it 'should not persist a Submission' do
        expect(assigns(:submission)).to_not be_persisted
      end
    end
  end
end
