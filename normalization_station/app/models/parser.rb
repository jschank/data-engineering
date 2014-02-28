class Parser
  def self.process(file)
    purchases = []
    file.each_line.with_index do |line, index|
      next if index == 0
      purchaser_name, item_description, item_price, purchase_count, merchant_address, merchant_name = line.split("\t")

      purchaser = Purchaser.find_or_create_by_name(purchaser_name)
      purchaser.save!

      merchant = Merchant.find_or_create_by_name_and_address(merchant_name, merchant_address)
      merchant.save!

      item = Item.find_or_create_by_description_and_price(item_description, item_price)
      item.save!

      merchant.items << item
      merchant.save!

      purchase = Purchase.new
      purchase.purchaser = purchaser
      purchase.item = item
      purchase.count = purchase_count
      purchase.save!

      purchases << purchase
    end

    gross_revenue = purchases.inject(0) { |acc, purchase| acc += (purchase.item.price * purchase.count) }
    gross_revenue

  end
end
