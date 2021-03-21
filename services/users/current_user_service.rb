require_relative 'users_container'

module Users
  class CurrentUserService < BaseService
    include Import['create_user']

    def intiialize
      super
    end

    def call(mac_address)
      user = User.find(mac_address: mac_address)

      @result = user || create_user.call(mac_address: mac_address).result

      self
    end
  end
end
