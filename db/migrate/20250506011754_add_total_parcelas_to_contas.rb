class AddTotalParcelasToContas < ActiveRecord::Migration[8.0]
  def change
    add_column :contas, :total_parc, :integer
  end
end
