class Parser
  def self.process(file)
    purchases = []
    file.each_line.with_index do |line, index|
      next if index == 0
      purchaser_name, item_description, item_price, purchase_count, merchant_address, merchant_name = line.split("\t")

      purchaser = Purchaser.find_or_create_by(name: purchaser_name)
      merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
      item = Item.find_or_create_by(description: item_description, price: item_price)

      merchant.items << item
      merchant.save!

      purchase = Purchase.new
      purchase.purchaser = purchaser
      purchase.item = item
      purchase.count = purchase_count
      purchase.save!

      purchases << purchase
    end

    # this math is done here, because the gross revenues are per upload, not for the current
    # state of the database.
    gross_revenue = purchases.inject(0) { |acc, purchase| acc += (purchase.item.price * purchase.count) }
    gross_revenue

  end
end
