class Bank < ApplicationRecord
  validates :name, :pid, presence: true, uniqueness: true
  validates :pid, length: { is: 11 }
  has_many :users, dependent: :restrict_with_error
end
