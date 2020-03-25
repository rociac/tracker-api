require 'rails_helper'

RSpec.describe "Measures", type: :request do
  let!(:measures) { create_list(:measure, 6) }
  let(:measure_id) { measures.first.id }

  describe 'GET /measures' do
    before { get '/measures' }

    it 'returns measures' do
      expect(json).not_to be_empty
      expect(json.size).to eq(6)
    end
  end

  describe 'GET /measures/:id' do
    before { get "/measures/#{measure_id}" }

    context 'when the record exists' do
      it 'returns the measure' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(measure_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:measure_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measure/)
      end
    end
  end

  describe 'POST /measures' do
    let(:valid_attributes) { { name: 'Bicep'} }

    context 'when the request is valid' do
      before { post '/measures', params: valid_attributes }

      it 'creates a measure' do
        expect(json['name']).to eq('Bicep')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/measures', params: { name: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /measures/:id' do
    let(:valid_attributes) { { name: 'Tricep' } }

    context 'when the record exists' do
      before { put "/measures/#{measure_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /measures/:id' do
    before { delete "/measures/#{measure_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
