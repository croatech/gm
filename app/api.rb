module Sphinx
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::Sphinx::Users
  end
end
