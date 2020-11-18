class DeliveryAddress < ApplicationRecord
  has_one :purchase
end
