class Reclamacao < ApplicationRecord
  belongs_to :usuario
  validates :titulo, presence: true, length: {minimum: 3, maximum: 20}, uniqueness: true
  validates :texto, presence: true, length: {minimum: 10, maximum: 600}
  validates :categoria_problema, presence: true, length: {maximum: 20}
  validates :empresa, presence: true
end
