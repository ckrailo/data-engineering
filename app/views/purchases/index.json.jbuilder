json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :purchaser_id, :item_id, :count
  json.url purchase_url(purchase, format: :json)
end
