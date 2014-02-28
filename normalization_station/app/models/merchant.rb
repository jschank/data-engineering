class Merchant < ActiveRecord::Base
  has_many :items, :uniq => true
end
