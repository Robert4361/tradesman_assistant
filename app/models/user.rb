class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :bank
  validates :first_name, :last_name, :business_name, :business_description, :pid, :post_number, :business_name, :iban, :city, presence: true
  validates :iban, :pid, uniqueness: true
  validates :first_name, :last_name, :city, format: { with: /\A[a-zA-Zšđčćž]+\z/,
                                                      message: "only allows letters" }
  validates :pid, :post_number, numericality: true
end
