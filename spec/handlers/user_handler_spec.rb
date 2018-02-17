require 'rails_helper'

RSpec.describe Handlers::UserHandler do

  context 'when receiving api data' do
    context 'with valid params' do
      let(:valid_params) { JSON.parse('{"id":"1623", "login":"fake boy", "html_url":"github.com/fakeuser"}') }

      context 'when new' do
        before { User.destroy_all }
        it 'creates a new user' do
          Handlers::UserHandler.handle_api_data(valid_params)
          user = User.first
          expect(User.count).to eq 1
          expect(user.login).to eq 'fake boy'
          expect(user.html_url).to eq 'github.com/fakeuser'
        end
      end

      context 'when persisted' do
        let(:user) { FactoryBot.build(:user, id: 1623) }
        it 'updates the existent user' do
          expect(user.login).to eq "Fake User"
          Handlers::UserHandler.handle_api_data(valid_params)
          user.reload
          expect(user.login).to eq 'fake boy'
          expect(user.html_url).to eq 'github.com/fakeuser'
        end
      end
    end

    context 'with invalid params' do
      let(:invalid_params)  { {"invalid"=>""} }
      before { User.destroy_all }

      it 'does not save and show no error when invalid' do
        expect{Handlers::UserHandler.handle_api_data(invalid_params)}.to_not raise_error
        expect(User.count).to eq 0
      end

      it 'does not save and show no error when nil' do
        expect{Handlers::UserHandler.handle_api_data(nil)}.to_not raise_error
        expect(User.count).to eq 0
      end
    end
  end
end