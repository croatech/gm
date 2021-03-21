require 'sequel'

class Game < Sequel::Model
  def validate
    errors.add(:user_id, 'cannot be empty') if user_id.nil?
  end

  def finish!
    self.update(active: false)
  end

  def self.active
    self.where(active: true)
  end
end
