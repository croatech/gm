require 'httparty'

class ThemoviedbClient
  include ::HTTParty
  base_uri ENV['THEMOVIEDB_URL']

  def initialize
    @options = { query: { api_key: ENV['THEMOVIEDB_TOKEN'], language: 'ru' } }
  end

  def get_movie(id)
    ThemoviedbClient.get("/movie/#{id}", options)
  end

  private

  attr_reader :options
end
