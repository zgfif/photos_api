class Token < ApplicationRecord
  validates :value, presence: true

  def self.recent
    order('updated_at desc').limit(1)[0]
  end
end
