require_relative '../models'

Dir[File.expand_path('../models/*.rb', __dir__)].each do |f|
  require f
end

module Seeds
  class << self
    def call
      DB.transaction do
        seed_movies if Movie.count.zero?
        seed_users if User.count.zero?
      end
    end

    def seed_movies
      Movie.create(title: 'Inception', image: 'image.png', external_id: 1, release_year: 2010)
      puts 'Movies imported'
    end

    def seed_users
      User.create(mac_address: '00:1B:44:11:3A:B7')
      puts 'Users imported'
    end
  end
end
