require 'dotenv/load'
Dotenv.load

migrate = lambda do |env, version|
  ENV['RACK_ENV'] = env
  require_relative 'db'
  Sequel.extension :migration
  Sequel::Migrator.apply(DB, 'db/migrations', version)
end

namespace :db do
  desc 'Run migrations'
  task :migrate do
    migrate.call('development', nil)
  end
end

desc 'Annotate Sequel models'
task 'annotate' do
  ENV['RACK_ENV'] = 'development'
  require_relative 'models'
  require 'sequel/annotate'
  Sequel::Annotate.annotate(Dir['models/*.rb'])
end

desc 'Import movies'
task 'import_movies' do
  require_relative 'models'
  require_relative 'services/import_movies_service'
  ImportMoviesService.new.call
end
