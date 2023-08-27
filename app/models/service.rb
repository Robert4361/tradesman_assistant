class Service < ApplicationRecord
  belongs_to :measurement
  belongs_to :user
  validates :name, :price, presence: true
  validates :price, numericality: true
end
