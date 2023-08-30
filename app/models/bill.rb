class Bill < ApplicationRecord
  after_initialize :set_defaults, if: :new_record?
  before_save :check_items

  belongs_to :client
  belongs_to :user
  has_many :bill_items
  accepts_nested_attributes_for :bill_items, reject_if: :all_blank, allow_destroy: true
  validates :discount, presence: true

  private
  def set_defaults
    self.status = false
    self.date = Date.current
  end

  def check_items
    if bill_items.empty?
      errors.add(:base, "You cannot create an empty bill")
      throw :abort
    end
  end
end
