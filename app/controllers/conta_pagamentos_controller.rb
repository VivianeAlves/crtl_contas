class ContaPagamentosController < ApplicationController
    def consulta
        @pagamentos = ContaPagamento.order(data_pagamento: :desc).page(params[:page]).per(5)
    end

    def edit
        @pagamento = ContaPagamento.find(params[:id])
        render partial: 'update_inline', locals: {pagamento: @pagamento }
    end

    def update
        @pagamento = ContaPagamento.find(params[:id])
        if @pagamento.update(pagamento_params)
            render partial: 'pagamento_id', locals: {pagamento: @pagamento }
        else
            edit
        end
    end

  private

   def pagamento_params
    params.require(:conta_pagamento).permit(:data_pagamento, :parcela)
   end

end
