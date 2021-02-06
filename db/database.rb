require 'sequel'
require 'logger'

module Database
  def self.connection
    @client ||= Sequel.postgres(
      ENV['POSTGRES_DATABASE'],
      port: ENV['POSTGRES_PORT'],
      host: ENV['POSTGRES_HOST'],
      user: ENV['POSTGRES_USER'],
      password: ENV['POSTGRES_PASSWORD'],
      logger: Logger.new($stderr))
    @client
  end
end
