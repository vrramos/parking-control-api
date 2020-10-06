class Parking < ApplicationRecord
  validates :plate, presence: true
end
