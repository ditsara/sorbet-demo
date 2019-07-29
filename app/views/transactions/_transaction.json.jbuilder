json.extract! transaction, :id, :narrative, :status, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
