class ChangeVencimentoTypeInConta < ActiveRecord::Migration[8.0]
  def change
    change_column :contas, :vencimento, :date
  end
end
