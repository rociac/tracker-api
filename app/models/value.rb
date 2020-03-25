class Value < ApplicationRecord
  belongs_to :measure
  validates :value, presence: true
end
