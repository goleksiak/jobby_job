require 'rails_helper'

RSpec.describe JobsController, type: :controller do

  describe 'GET #index' do

    let(:job) { create :job }

    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns @jobs' do
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe 'GET #show' do

    let(:job) { create :job }

    before { get :show, id: job.id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns @job' do
      expect(assigns(:job)).to eq(job)
    end
  end
end
