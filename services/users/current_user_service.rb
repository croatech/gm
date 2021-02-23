require_relative 'users_container'

module Users
  class CurrentUserService
    include Import['create_user']

    def call(mac_address)
      user = User.find(mac_address: mac_address)
      user || create_user.call(mac_address: mac_address)
    end
  end
end
