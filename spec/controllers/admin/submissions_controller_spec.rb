require 'rails_helper'

RSpec.describe Admin::SubmissionsController, type: :controller do

  before { sign_in }

  describe 'GET #show' do

    let(:submission) { create :submission_with_job }

    before { get :show, id: submission.id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns @submission' do
      expect(assigns(:submission)).to eq(submission)
    end
  end
end
