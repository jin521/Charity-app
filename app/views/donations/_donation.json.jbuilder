json.extract! donation, :id, :campaign_id, :email, :amount, :credit_card_details, :user_id, :created_at, :updated_at
json.url donation_url(donation, format: :json)
