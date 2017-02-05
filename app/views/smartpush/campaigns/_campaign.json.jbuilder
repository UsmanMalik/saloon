json.extract! campaign, :id, :title, :description, :start_date, :end_date, :budget, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)