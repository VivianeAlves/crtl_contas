class Conta < ApplicationRecord
  belongs_to :tipo_conta
  has_many :conta_pagamentos, class_name: "ContaPagamento", dependent: :destroy

  def ajustes_data_pagamento_e_parcelas
    if pago
      define_data_pagamento
      calcula_parcela_atual
    end
  end

  def define_data_pagamento
    ContaPagamento.create(data_pagamento: Date.today, parcela: n_parc_restantes, conta_id: id)
  end

  def calcula_parcela_atual
    if (!n_parc_restantes.nil? && n_parc_restantes > 0)
      update(n_parc_restantes: n_parc_restantes - 1)
    end
  end

  def inativa_conta_unica
    #TipoConta id:3 é única
    if (compara_current_conta_id_c_tpconta("Única") && self.pago)
      update(ativo: false)
    end
  end

  def retorna_id_tipoconta(nome_conta)
    return TipoConta.where(nome: nome_conta)[0].id
  end

  def compara_current_conta_id_c_tpconta(nome_conta)
    return self.tipo_conta_id == retorna_id_tipoconta(nome_conta)
  end

  def desativa_parcela_zerada
    if n_parc_restantes == 0
      update(ativo: false)
    end
  end




  #jobs cria no banco os temporarios enquanto tiver parcela ou tiverem data em vigencia para pagamento
  #a cada parcela paga diminuir do total de parcelas
  #guardar a data em q a conta foi paga!
  #criar tabela que consta as datas de pagamento de cada conta - conta acompanhamento
  #modelagem um para muitos, na qual uma conta tem varias datas de pagamento - e numero da parcela (se houver)
  #fazer rollback no banco quando modelar a nova tabela (amanhã 02/05)
  #só mostrar parcelas e total parcelas se a conta for temporaria
  #só renderizar os campos de parcela se a conta for temporaria
end
