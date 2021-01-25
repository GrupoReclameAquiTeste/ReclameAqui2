json.extract! usuario, :id, :login, :password_digest, :email, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
