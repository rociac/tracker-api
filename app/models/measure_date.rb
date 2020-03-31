class MeasureDate < ApplicationRecord
  belongs_to :user
  has_many :measures
end
