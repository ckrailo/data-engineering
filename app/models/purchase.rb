class Purchase < ActiveRecord::Base
  belongs_to :purchaser, inverse_of: :purchases
  belongs_to :merchant, inverse_of: :purchases
  belongs_to :item, inverse_of: :purchases
end
