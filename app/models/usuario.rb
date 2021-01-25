class Usuario < ApplicationRecord
  has_secure_password
  has_many :reclamacaos

  validates :login, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6, maximum: 20}
end
