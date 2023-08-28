class Client < ApplicationRecord
  belongs_to :user
  has_many :bills
  validates :first_name, :last_name, :city, :address, :pid, presence: true
end
