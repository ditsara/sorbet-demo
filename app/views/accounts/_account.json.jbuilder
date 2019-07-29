json.extract! account, :id, :name, :code, :account_type, :archived, :created_at, :updated_at
json.url account_url(account, format: :json)
