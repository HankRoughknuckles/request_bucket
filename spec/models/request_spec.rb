require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'associated endpoint' do
    let!(:endpoint) { create :endpoint }
    let!(:request) { create :request, endpoint: endpoint }

    it 'should work' do
      expect(request.endpoint).to eq endpoint
    end
  end
end
