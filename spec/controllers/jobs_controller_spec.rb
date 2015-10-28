require 'rails_helper'

RSpec.describe JobsController, type: :controller do

  describe 'GET #index' do

    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns Jobs' do
      expect(assigns(:jobs)).to be
    end
  end
end
