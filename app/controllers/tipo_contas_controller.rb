class TipoContasController < ApplicationController
  before_action :set_tipo_conta, only: %i[ show edit update destroy ]

  # GET /tipo_contas or /tipo_contas.json
  def index
    @tipo_contas = TipoConta.all
  end

  # GET /tipo_contas/1 or /tipo_contas/1.json
  def show
  end

  # GET /tipo_contas/new
  def new
    @tipo_conta = TipoConta.new
  end

  # GET /tipo_contas/1/edit
  def edit
  end

  # POST /tipo_contas or /tipo_contas.json
  def create
    @tipo_conta = TipoConta.new(tipo_conta_params)

    respond_to do |format|
      if @tipo_conta.save
        format.html { redirect_to @tipo_conta, notice: "Tipo conta was successfully created." }
        format.json { render :show, status: :created, location: @tipo_conta }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_contas/1 or /tipo_contas/1.json
  def update
    respond_to do |format|
      if @tipo_conta.update(tipo_conta_params)
        format.html { redirect_to @tipo_conta, notice: "Tipo conta was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_conta }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_contas/1 or /tipo_contas/1.json
  def destroy
    @tipo_conta.destroy!

    respond_to do |format|
      format.html { redirect_to tipo_contas_path, status: :see_other, notice: "Tipo conta was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_conta
      @tipo_conta = TipoConta.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tipo_conta_params
      params.expect(tipo_conta: [ :nome ])
    end
end
