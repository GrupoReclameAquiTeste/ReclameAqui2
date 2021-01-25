class CreateReclamacaos < ActiveRecord::Migration[6.1]
  def change
    create_table :reclamacaos do |t|
      t.string :titulo
      t.text :texto
      t.string :categoria_problema
      t.integer :empresa
      t.integer :usuario_id

      t.timestamps
    end
  end
end
