module Sphinx
  module Api
    class Games < Base
      helpers AuthHelpers

      before do
        authenticate!
      end

      post '/games' do
        service = ::Games::CreateGameService.new.call(current_user)

        GameSerializer.new(service.result)
      end
    end
  end
end
