module Games
  class CreateGameService < BaseService
    def initialize
      super
    end

    def call(current_user)
      @current_user = current_user

      active_game&.finish!

      @result = Game.create(user_id: current_user.id)

      self
    end

    private

    def active_game
      @active_game ||= current_user.active_game
    end
  end
end
