class Game < ApplicationRecord
  has_many :moves
  validates :result, presence: true
end
