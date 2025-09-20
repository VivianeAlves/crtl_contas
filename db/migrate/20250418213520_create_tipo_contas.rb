class CreateTipoContas < ActiveRecord::Migration[8.0]
  def change
    create_table :tipo_contas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
