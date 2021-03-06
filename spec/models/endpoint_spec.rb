require 'rails_helper'

RSpec.describe Endpoint, type: :model do

  describe 'associated requests' do
    let!(:endpoint) { create :endpoint }
    let!(:request) { create :request, endpoint: endpoint }

    it 'should work' do
      expect(endpoint.requests.count).to eq 1
      expect(endpoint.requests.first).to eq request
    end
  end

  describe 'signature' do
    let(:endpoint) { build :endpoint, signature: signature }

    context 'when not present' do
      let(:signature) { '' }

      it 'should get added automatically' do
        endpoint.save
        expect(endpoint.signature).to be_present
      end

      it 'should be generated upon validation' do
        expect { endpoint.valid? }
          .to change { endpoint.signature }
          .to be_present
      end
    end

    context 'when present' do
      let(:signature) { 'already_present' }

      it 'should not get overwritten on save' do
        expect { endpoint.save }.not_to change { endpoint.signature }
      end
    end
  end
end
