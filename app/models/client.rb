class Client < ApplicationRecord
  belongs_to :user
  has_many :bills
  validates :first_name, :last_name, :email, :city, :address, :pid, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
end
