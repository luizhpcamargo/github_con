require 'rails_helper'
require 'webmock/rspec'

RSpec.describe GithubService do

  context 'when consuming github api' do
    let(:header) do
      { 'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host'=>'api.github.com',
        'User-Agent'=>'Ruby' }
    end
    let(:uri) { '/api.github.com/' }
    let(:success_res) { '{"items": [{"id": 1, "name": "fake repo"}]}' }
    let(:error_res) { '{"errors": [{ "message": "error"}]}' }

    context 'with success' do
      it 'returns a json with data' do
        stub_request(:get, /api.github.com/).with(headers: header).to_return(status: 200, body: success_res, headers: {})
        response = GithubService.call
        expect(response).to eq(JSON.parse(success_res))
      end
    end

    context 'with error' do
      it 'returns a json with error message' do
        stub_request(:get, /api.github.com/).with(headers: header).to_return(status: 400, body: error_res, headers: {})
        response = GithubService.call
        expect(response).to eq({ code: "400", message: "error"})
      end
    end
  end
end