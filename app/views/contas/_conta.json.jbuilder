json.extract! conta, :id, :nome, :tipo_conta_id, :inicio, :fim, :vencimento, :pago, :n_parc, :ativo, :created_at, :updated_at
json.url conta_url(conta, format: :json)
