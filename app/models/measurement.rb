class Measurement < ApplicationRecord
  belongs_to :user
  has_many :services
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
