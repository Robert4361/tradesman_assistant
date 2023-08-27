class Client < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :city, :address, :pid, presence: true
end
