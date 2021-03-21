module Sphinx
  class API < Grape::API
    prefix :api
    format :json
    helpers Helpers

    mount ::Sphinx::Api::Users
    mount ::Sphinx::Api::Games
  end
end
