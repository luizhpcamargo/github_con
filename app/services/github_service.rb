require 'net/http'

class GithubService

  SORT = 'stars'.freeze
  ORDER = 'desc'.freeze
  RESULTS = '5'.freeze
  LANGUAGES = %w(ruby lua elixir python swift).freeze

  def self.call
    LANGUAGES.each { |l| new(l).call }
  end

  def call
    response = api_response
  end

  def initialize(language=nil)
    @uri = URI('https://api.github.com/search/repositories')
    @params = {q: "language:#{language}", sort: SORT, order: ORDER, page: '1', per_page: RESULTS}
    @uri.query = URI.encode_www_form(@params)
  end

  private

  def api_response
    response = Net::HTTP.get_response(@uri)
    formatted_response = handle_response(response)
    return formatted_response if formatted_response[:error]
    Handlers::RepositoryHandler.handle_api_data(formatted_response)
  end

  def handle_response(res)
    json_res = JSON.parse(res.body)
    res.is_a?(Net::HTTPSuccess) ? json_res : {error: {code: res.code, message: json_res.dig('errors')[0].dig('message')}}
  end

end
