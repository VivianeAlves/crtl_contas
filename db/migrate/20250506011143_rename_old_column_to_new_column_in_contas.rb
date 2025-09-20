class RenameOldColumnToNewColumnInContas < ActiveRecord::Migration[8.0]
  def change
    rename_column :contas, :n_parc, :n_parc_restantes
  end
end
