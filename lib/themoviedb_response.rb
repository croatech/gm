require 'byebug'

class ThemoviedbResponse
  def initialize(response)
    @response = response.parsed_response
  end

  def success?
    response['success'].nil? ? true : false
  end

  def image
    response['backdrop_path']
  end

  def title
    response['title']
  end

  def release_year
    Date.parse(response['release_date']).year
  end

  private

  attr_reader :response
end
