class Purchaser < ActiveRecord::Base
  has_many :purchases, inverse_of: :purchaser
end
