module Users
  class CreateUserService < BaseService
    def initialize
      super
    end

    def call(params)
      @result = User.create(params)

      self
    end
  end
end
