require 'rails_helper'

RSpec.describe Handlers::RepositoryHandler do

  context 'when receiving api data' do
    context 'with valid params' do
      let(:valid_params) { JSON.parse('{"items": [{"id":"4815", "name":"fake repo", "language":"C",
                                                   "stargazers_count":"1", "html_url":"jups.com",
                                                   "created_at":"2018-02-08T23:43:44.698Z",
                                                   "owner":{"id":"1623", "login":"fake user",
                                                   "html_url":"github.com/fakesuer"}}]}') }

      context 'when new' do
        before { Repository.destroy_all }
        it 'creates a new repository' do
          Handlers::RepositoryHandler.handle_api_data(valid_params)
          repo = Repository.first
          expect(Repository.count).to eq 1
          expect(repo.name).to eq 'fake repo'
          expect(repo.language).to eq 'C'
          expect(repo.stargazers_count).to eq 1
          expect(repo.html_url).to eq 'jups.com'
          expect(repo.creation_date).to eq '2018-02-08T23:43:44.698Z'.to_time
          expect(repo.owner.id).to eq 1623
        end
      end

      context 'when persisted' do
        let(:user) { FactoryBot.build(:user, id: 2342) }
        let(:repo) { FactoryBot.build(:repository, id: 4815, name:"custom name", owner: user) }
        it 'updates the existent repository' do
          expect(repo.name).to eq "custom name"
          Handlers::RepositoryHandler.handle_api_data(valid_params)
          repo.reload
          expect(repo.name).to eq 'fake repo'
          expect(repo.language).to eq 'C'
          expect(repo.stargazers_count).to eq 1
          expect(repo.html_url).to eq 'jups.com'
          expect(repo.creation_date).to eq '2018-02-08T23:43:44.698Z'.to_time
          expect(repo.owner.id).to eq 1623
        end
      end
    end

    context 'with invalid params' do
      let(:invalid_params)  { {"invalid"=>""} }
      before { Repository.destroy_all }

      it 'does not save and show no error when invalid' do
        expect{Handlers::RepositoryHandler.handle_api_data(invalid_params)}.to_not raise_error
        expect(Repository.count).to eq 0
      end

      it 'does not save and show no error when nil' do
        expect{Handlers::RepositoryHandler.handle_api_data(nil)}.to_not raise_error
        expect(Repository.count).to eq 0
      end
    end
  end
end