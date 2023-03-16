# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Rates' do
  describe 'GET /api/v1/rates' do
    let(:credentials) do
      {
        key: 'your_key',
        password: 'your_password',
        account_number: 'your_account_number',
        meter_number: 'your_meter_number'
      }
    end

    let(:quote_params) do
      {
        address_from: {
          zip: '64000',
          country: 'mx'
        },
        address_to: {
          zip: '64000',
          country: 'mx'
        },
        parcel: {
          length: 25.0,
          width: 28.0,
          height: 46.0,
          distance_unit: 'cm',
          weight: 6.5,
          mass_unit: 'kg'
        }
      }
    end

    before do
      allow(Fedex::Rates).to receive(:get).and_return([])
    end

    context 'with params' do
      it 'returns http status ok' do
        get api_v1_rates_path(credentials:, quote_params:), as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'without params' do
      it 'returns http status ok' do
        get api_v1_rates_path, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
