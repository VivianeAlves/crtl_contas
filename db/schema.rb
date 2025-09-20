# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_17_041152) do
  create_table "atualizacoes", force: :cascade do |t|
    t.date "ultima_atualizacao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conta_pagamentos", force: :cascade do |t|
    t.date "data_pagamento"
    t.integer "conta_id", null: false
    t.integer "parcela"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conta_id"], name: "index_conta_pagamentos_on_conta_id"
  end

  create_table "contas", force: :cascade do |t|
    t.string "nome"
    t.integer "tipo_conta_id", null: false
    t.date "inicio"
    t.date "fim"
    t.date "vencimento"
    t.boolean "pago"
    t.integer "n_parc_restantes"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_parc"
    t.index ["tipo_conta_id"], name: "index_contas_on_tipo_conta_id"
  end

  create_table "tipo_contas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "conta_pagamentos", "contas"
  add_foreign_key "contas", "tipo_contas"
end
