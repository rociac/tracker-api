class Measure < ApplicationRecord
  has_many :values, dependent: :destroy

  validates :name, presence: true
end
