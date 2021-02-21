module Sphinx
  module Api
    class Users < Base
      helpers AuthHelpers

      before do
        authenticate!
      end

      get '/users/current' do
        UserSerializer.new(current_user)
      end
    end
  end
end
