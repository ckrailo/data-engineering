class Item < ActiveRecord::Base
  has_many :purchases, inverse_of: :item
  belongs_to :merchant, inverse_of: :items
end
