class ProcessarContasJob < ApplicationJob
  queue_as :default

  def perform(*args)
    contas = Conta.where(ativo: true, pago: true)
    contas.each do |conta|
      #conta.update(pago: false)
      novo_vencimento = conta.vencimento >> 1
      conta.update(vencimento: novo_vencimento)
      #puts "Processando conta ##{conta.id} - #{conta.nome}"
      Rails.logger.info "Conta ##{conta.id} processada com novo vencimento: #{novo_vencimento}"
    end
     Rails.logger.info "Processamento de contas concluído."
  end
end
