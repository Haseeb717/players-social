json.extract! player, :id, :name, :email, :about, :image, :created_at, :updated_at
json.url player_url(player, format: :json)
