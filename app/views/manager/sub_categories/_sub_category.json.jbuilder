json.extract! sub_category, :id, :title, :description, :category_id, :created_at, :updated_at
json.url sub_category_url(sub_category, format: :json)