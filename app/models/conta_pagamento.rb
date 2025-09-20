class ContaPagamento < ApplicationRecord
    belongs_to :conta

    def retona_total_de_parcelas
        if verifica_se_parcela_total_existe
            return conta.total_parc
        end
    end

    def calculo_parcelas_pagas
        if verifica_se_parcela_total_existe
            return (conta.total_parc - self.parcela)+1
        else
            return self.parcela
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
