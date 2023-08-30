class Bill < ApplicationRecord
  after_initialize :set_defaults, if: :new_record?
  after_find :calculate_price
  before_save :check_items

  belongs_to :client
  belongs_to :user
  has_many :bill_items, dependent: :delete_all
  accepts_nested_attributes_for :bill_items, reject_if: :all_blank, allow_destroy: true
  validates :discount, presence: true

  attr_accessor :price

  private

  def set_defaults
    self.paid = false
    self.date = Date.current
  end

  def check_items
    if bill_items.empty?
      errors.add(:base, "You cannot create an empty bill")
      throw :abort
    end
  end

  def calculate_price
    self.price = (bill_items.sum { |bill_item| bill_item.service.price * bill_item.quantity }) * (1 - (discount / 100.0))
  end

end
