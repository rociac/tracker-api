class User < ApplicationRecord
  has_secure_password
  has_many :measure_dates
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def to_token_payload
    {
      sub: id,
      name: name
    }
  end
end
