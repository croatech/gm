module Users
  class CreateUserService
    def call(params)
      User.create(params)
    end
  end
end
