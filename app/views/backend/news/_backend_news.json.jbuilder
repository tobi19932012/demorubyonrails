json.extract! backend_news, :id, :created_at, :updated_at
json.url backend_news_url(backend_news, format: :json)
