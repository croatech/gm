require_relative '../lib/themoviedb_client'
require_relative '../lib/themoviedb_response'
require_relative '../models/movie'
require 'async'

class ImportMoviesService
  def call
    start_from_external_id = DB[:movies].select(:external_id).order(:external_id).last[:exiternal_id] || 1

    (start_from_external_id..1_000_000).to_a.each do |index|
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
