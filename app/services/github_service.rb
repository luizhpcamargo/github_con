require 'net/http'

class GithubService

  SORT = 'stars'.freeze
  ORDER = 'asc'.freeze
  RESULTS = '5'.freeze

  def self.call
    new.call
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
    handle_response(response)
  end

  def handle_response(res)
    json_res = JSON.parse(res.body)
    res.is_a?(Net::HTTPSuccess) ? json_res : {code: res.code, message: json_res.dig('errors')[0].dig('message')}
  end

end
