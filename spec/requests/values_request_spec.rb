require 'rails_helper'

RSpec.describe "Values", type: :request do
  let!(:measure) { create(:measure) }
  let!(:values) { create_list(:value, 20, measure_id: measure.id) }
  let(:measure_id) { measure.id }
  let(:id) { values.first.id }

  describe 'GET /measures/:measure_id/values' do
    before { get "/measures/#{measure_id}/values" }

    context 'when measure exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all measure values' do
        expect(json.size).to eq(20)
      end
    end

    context 'when measure does not exist' do
      let(:measure_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'GET /measures/:measure_id/values/:id' do
    before { get "/measures/#{measure_id}/values/#{id}" }

    context 'when measure value exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when the measure value does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Value/)
      end
    end
  end

  describe 'POST /measures/:measure_id/values' do
    let(:valid_attributes) { { value: 50.3 } }

    context 'when request attributes are valid' do
      before { post "/measures/#{measure_id}/values", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/measures/#{measure_id}/values", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Value can't be blank/)
      end
    end
  end

  describe 'PUT /measures/:measure_id/values/:id' do
    let(:valid_attributes) { { value: 75.4} }

    before { put "/measures/#{measure_id}/values/#{id}", params: valid_attributes }

    context 'when value exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_value = Value.find(id)
        expect(updated_value.value).to eq(75.4)
      end
    end

    context 'when the value does not exist' do
      let(:id) { 0 }

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Value/)
      end
    end
  end

  describe 'DELETE /measures/:measure_id/values/:id' do
    before { delete "/measures/#{measure_id}/values/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
