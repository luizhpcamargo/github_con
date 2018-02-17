module Handlers
  class RepositoryHandler
    def self.handle_api_data(data = nil)
      return unless data.present? && data['items'].present?
      data['items'].each do |repo_data|
        return unless repo_data.present? && repo_data.dig('id').to_i != 0
        repo = Repository.where(id: repo_data.dig('id')).first_or_initialize
        repo.name = repo_data.dig('name')
        repo.language = repo_data.dig('language')
        repo.stargazers_count = repo_data.dig('stargazers_count')
        repo.watchers_count = repo_data.dig('watchers_count')
        repo.forks_count = repo_data.dig('forks_count')
        repo.html_url = repo_data.dig('html_url')
        repo.description = repo_data.dig('description')
        repo.creation_date = repo_data.dig('created_at')&.to_time
        repo.update_date = repo_data.dig('updated_at')&.to_time
        repo.owner = UserHandler.handle_api_data(repo_data.dig('owner'), repo)
        repo.save
      end
    end
  end
end