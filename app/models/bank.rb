class Bank < ApplicationRecord
  validates :name, :pid, presence: true, uniqueness: true
  validates :pid, length: { is: 11 }
  has_many :users
end
