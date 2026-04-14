class RemoveParcelaFromContaPagamentos < ActiveRecord::Migration[8.0]
  def change
    remove_column :conta_pagamentos, :parcela, :integer
  end
end
