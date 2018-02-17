module Handlers
  class UserHandler
    def self.handle_api_data(data = nil, repo = nil)
      return unless data.present? && data.dig('id').to_i != 0
      user = User.where(id: data.dig('id')).first_or_initialize
      user.login = data.dig('login')
      user.avatar_url = data.dig('avatar_url')
      user.html_url = data.dig('html_url')
      user.tap(&:save)
    end
  end
end