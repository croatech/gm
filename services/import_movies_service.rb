require_relative '../lib/themoviedb_client'
require_relative '../lib/themoviedb_response'
require_relative '../models/movie'
require 'byebug'

class ImportMoviesService
  def call
    1..90_000.times do |index|
      response = ThemoviedbResponse.new(client.get_movie(index))
      if response.success?
        begin
          movie = Movie.new(
            title: response.title,
            release_year: response.release_year,
            external_id: index,
            image: response.image)
          if movie.valid?
            movie.save
            puts "#{index} added"
          end
        rescue Exception => e
          puts e.message
          next
        end
      end
    end
  end

  private

  def client
    ThemoviedbClient.new
  end
end
