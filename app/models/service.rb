class Service < ApplicationRecord
  belongs_to :measurement
  belongs_to :user
end
