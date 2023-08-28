class Bill < ApplicationRecord
  after_initialize :set_defaults, if: :new_record?

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
end
