class Move < ApplicationRecord
  belongs_to :game
  validates :name, presence: true
  validates :move, inclusion: { in: ["paper", "scissor", "rock"] }
end
