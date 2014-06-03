class Merchant < ActiveRecord::Base
  has_many :purchases, inverse_of: :merchant
  has_many :items, inverse_of: :merchant
end
