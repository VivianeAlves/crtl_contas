class ContaPagamento < ApplicationRecord
    belongs_to :conta

    #TODO drop atributto parcela da tabela conta_pagamento

    def retona_total_de_parcelas
        if verifica_se_parcela_total_existe
            return conta.total_parc
        end
    end

    def calculo_parcelas_pagas
        if verifica_se_parcela_total_existe
            return (conta.total_parc - conta.n_parc_restantes)
        end
    end

    def verifica_se_parcela_total_existe
        if !conta.total_parc.nil?
            return true
        else
            return false
        end
    end

end
