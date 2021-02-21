module Sphinx
  class Users < Grape::API
    format :json
    get '/users' do
      { ping: 'pong' }
    end
  end
end
