json.extract! restaurant, :id, :name, :street, :city, :desc, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
