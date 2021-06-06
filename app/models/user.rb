class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def need_new_token?
    token.nil? || Time.now >= token_expires
  end
end
