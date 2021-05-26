class Review < ApplicationRecord
  RATINGS = [0, 1, 2, 3, 4, 5].freeze

  belongs_to :restaurant

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: RATINGS }, numericality: { only_integer: true }
end
