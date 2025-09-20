class CreateContas < ActiveRecord::Migration[8.0]
  def change
    create_table :contas do |t|
      t.string :nome
      t.references :tipo_conta, null: false, foreign_key: true
      t.date :inicio
      t.date :fim
      t.integer :vencimento
      t.boolean :pago
      t.integer :n_parc
      t.boolean :ativo

      t.timestamps
    end
  end
end
