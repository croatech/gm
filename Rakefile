require 'dotenv/load'
Dotenv.load

require_relative 'db/seeds'

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

  desc 'Run seeds'
  task :seed do
    Seeds.call
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

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('config/environment', __dir__)
end

task routes: :environment do
  Sphinx::API.routes.each do |route|
    method = route.request_method.ljust(10)
    path = route.origin
    puts "     #{method} #{path}"
  end
end
