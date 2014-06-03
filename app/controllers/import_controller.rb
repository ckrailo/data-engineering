class ImportController < ApplicationController
  def new
  end

  def create
    header, *rows = params[:file].read.split("\n")
    rows.map!{|row| row.split("\t")}

    imported_purchases = []

    rows.each do |row|
      purchaser = Purchaser.find_or_create_by(name: row[0])

      merchant = Merchant.find_or_create_by(
        address: row[4],
        name: row[5])

      item = Item.find_or_create_by(
        description: row[1],
        price: row[2],
        merchant: merchant)

      # because there's no ID in the file import, assume
      # purchases can be exact copies of previous purchases
      # and create a new purchase row. if we had IDs, we could
      # just check for those IDs.
      purchase = Purchase.create(
        purchaser: purchaser,
        item: item,
        merchant: merchant,
        count: row[3])
      imported_purchases << purchase
    end

    @overall_revenue = imported_purchases.map do |purchase|
      purchase.item.price * purchase.count
    end.reduce(:+)

    @revenue_per_merchant = Hash.new(0.0)
    imported_purchases.each do |purchase|
      @revenue_per_merchant[purchase.merchant] += (purchase.item.price * purchase.count)
    end
  end
end