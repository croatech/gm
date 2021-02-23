$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'
require 'dotenv/load'
require_relative '../models'

Dotenv.load

Bundler.require :default, ENV['RACK_ENV']

['../api/*.rb', '../models/*.rb', '../serializers/*.rb', '../services/**/*.rb'].each do |path|
  Dir[File.expand_path(path, __dir__)].each do |f|
    require f
  end
end

require 'api'
require 'app'
