class BaseService
  attr_reader :result, :errors, :current_user

  def initialize
    @result = nil
    @errors = []
  end
end