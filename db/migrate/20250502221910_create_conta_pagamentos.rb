class CreateContaPagamentos < ActiveRecord::Migration[8.0]
  def change
    create_table :conta_pagamentos do |t|
      t.date :data_pagamento
      t.references :conta, null: false, foreign_key: true
      t.integer :parcela

      t.timestamps
    end
  end
end
