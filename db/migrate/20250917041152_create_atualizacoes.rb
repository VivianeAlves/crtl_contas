class CreateAtualizacoes < ActiveRecord::Migration[8.0]
  def change
    create_table :atualizacoes do |t|
      t.date :ultima_atualizacao, :null => false

      t.timestamps
    end
  end
end
