class DashboardController < ApplicationController
  
  def index
    @repos = Repository.all.order(language: :asc, stargazers_count: :desc)
  end

  def fetch_data
    call = GithubService.call
    redirect_back fallback_location: root_path
  end
  
end
