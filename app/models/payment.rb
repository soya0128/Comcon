class Payment < ApplicationRecord
  attr_accessor :token
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 24000 }
  validates :token, presence: true

  belongs_to :user
end