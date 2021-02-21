$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'
require 'dotenv/load'
require_relative '../models'

Dotenv.load

Bundler.require :default, ENV['RACK_ENV']

Dir[File.expand_path('../api/*.rb', __dir__)].each do |f|
  require f
end

Dir[File.expand_path('../models/*.rb', __dir__)].each do |f|
  require f
end

require 'api'
require 'app'
