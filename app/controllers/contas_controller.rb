class ContasController < ApplicationController
  before_action :set_conta, only: %i[ show edit update destroy ]

  # GET /contas or /contas.json
  def index
    # Para automaticamente fazer o update das contas pagas a lógica é a seguinte:
    # 1 - Toda vez que eu acessar a index eu verifico o mês da ultima atualização de lista efetuada no sistema
    # 2 - comparo o MÊS DO ÚLTIMA ATUALIZAÇÃO com o MÊS ATUAL
    # 3 - Se houve mudança de mês, eu atualizo todas as contas na index
    # 4 - ATUALIZO A ULTIMA DATA DE ATUALIZAÇÃO PARA A DATA ATUAL (IMPORTANTÍSSIMO)
    # 5 - assim garanto que as contas só serão atualizadas uma vez por mês
    @mes_atual = Date.current.month
    @ultima_atualizacao = Atualizacao.last.ultima_atualizacao.month if Atualizacao.last.present?

    if (@ultima_atualizacao != @mes_atual)
      puts "====================== ATUALIZANDO CONTAS ======================="
      #Executa o método que atualiza as contas
      atualiza
      #guarda no banco de dados que a função já foi executada esse mês para que não execute novamente
      Atualizacao.create(ultima_atualizacao: Date.current)
    end
    # retorna somente as contas ativas e não pagas
    @contas = Conta.where(ativo: true, pago: false)
  end

  # GET /contas/1 or /contas/1.json
  def show
  end

  # GET /contas/new
  def new
    @conta = Conta.new
  end

  # GET /contas/1/edit
  def edit
  end

  # POST /contas or /contas.json
  def create
    @conta = Conta.new(conta_params)
    respond_to do |format|
      if @conta.save
        format.html { redirect_to @conta, notice: "Conta was successfully created." }
        format.json { render :show, status: :created, location: @conta }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contas/1 or /contas/1.json
  def update
    respond_to do |format|
      
      if @conta.update(conta_params)
        @conta.ajustes_data_pagamento_e_parcelas
        @conta.inativa_conta_unica
        @conta.desativa_parcela_zerada
        format.html { redirect_to @conta, notice: "Conta was successfully updated." }
        format.json { render :show, status: :ok, location: @conta }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contas/1 or /contas/1.json
  def destroy
    @conta.destroy!

    respond_to do |format|
      format.html { redirect_to contas_path, status: :see_other, notice: "Conta was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def atualiza
    # Atualiza o vencimento de todas as contas ativas e pagas
    contas = Conta.where(ativo: true, pago: true)
    contas.each do |conta|
      novo_vencimento = (conta.vencimento >> 1)
      conta.update(vencimento: novo_vencimento)
      conta.update(pago: false)
    end

    redirect_to contas_path, notice: "Contas atualizadas com sucesso!"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta
      @conta = Conta.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def conta_params
      params.expect(conta: [ :nome, :tipo_conta_id, :inicio, :fim, :vencimento, :pago, :n_parc_restantes, :total_parc, :ativo ])
    end

end
