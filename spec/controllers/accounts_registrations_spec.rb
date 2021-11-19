require 'rails_helper'

RSpec.describe 'POST accounts/signup', type: :request do
  let(:url) { 'accounts' }
  let(:params) do
    {
      account: {
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  context 'when account is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new account' do
      expect(response.body).to match_schema('account')
    end
  end

  # context 'when account already exists' do
  #   before do
  #     Fabricate :account, email: params[:account][:email]
  #     post url, params: params
  #   end

  #   it 'returns bad request status' do
  #     expect(response.status).to eq 400
  #   end

  #   it 'returns validation errors' do
  #     expect(json['errors'].first['title']).to eq('Bad Request')
  #   end
  # end
end