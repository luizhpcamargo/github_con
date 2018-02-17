require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  context "GET #index" do
    let(:user) { FactoryBot.create(:user, id: 2342) }
    let(:repo1) { FactoryBot.create(:repository, id: 4816, language: "C++", stargazers_count: "2", name:"custom name", owner: user) }
    let(:repo2) { FactoryBot.create(:repository, id: 4817, language: "ruby", stargazers_count: "3", name:"custom name", owner: user) }
    let(:repo3) { FactoryBot.create(:repository, id: 4815, language: "ruby", stargazers_count: "1", name:"custom name", owner: user) }

    it 'renders the index view with repos' do
      get :index
      expect(repo1.name).to eq "custom name"
      expect(response).to render_template :index
      expect(assigns(:repos).first).to be_a_kind_of(Repository)
    end

    it 'has the repos in specific order' do
      get :index
      expect(repo1.stargazers_count).to eq 2
      expect(repo2.stargazers_count).to eq 3
      expect(repo3.stargazers_count).to eq 1
      expect(response).to render_template :index
      expect(assigns(:repos).first).to eq (repo1)
      expect(assigns(:repos).last).to eq (repo3)
    end
  end

  context 'GET #fetch_data' do
    it 'calls github service' do
      expect(GithubService).to receive(:call)
      get :fetch_data
      expect(response).to redirect_to(root_path)
    end
  end

end
