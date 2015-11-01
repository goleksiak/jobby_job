require 'rails_helper'

RSpec.describe Document, type: :model do

  it { is_expected.to belong_to(:submission) }

  describe '#save' do

    let(:document) { create :document }

    it 'should save the original content-type' do
      expect(document.content_type).to eq('text/plain')
    end

    it 'should save the original file name' do
      expect(document.original_filename).to eq('cover_letter.txt')
    end
  end
end
