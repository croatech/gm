class UsersContainer
  extend Dry::Container::Mixin

  register('create_user') { Users::CreateUserService.new }
end

Import = Dry::AutoInject(UsersContainer)
