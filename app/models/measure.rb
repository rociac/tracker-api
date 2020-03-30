class Measure < ApplicationRecord
  has_many :values, dependent: :destroy
  belongs_to :measure_date
  validates :name, presence: true
end
