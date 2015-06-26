json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :description, :price, :image_url
  json.url product_url(product, format: :json)
end
