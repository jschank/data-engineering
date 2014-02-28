class Merchant < ActiveRecord::Base
  has_many :items, -> {uniq}
end
