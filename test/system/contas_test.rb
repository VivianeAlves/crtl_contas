require "application_system_test_case"

class ContasTest < ApplicationSystemTestCase
  setup do
    @conta = contas(:one)
  end

  test "visiting the index" do
    visit contas_url
    assert_selector "h1", text: "Contas"
  end

  test "should create conta" do
    visit contas_url
    click_on "New conta"

    check "Ativo" if @conta.ativo
    fill_in "Fim", with: @conta.fim
    fill_in "Inicio", with: @conta.inicio
    fill_in "N parc", with: @conta.n_parc
    fill_in "Nome", with: @conta.nome
    check "Pago" if @conta.pago
    fill_in "Tipo conta", with: @conta.tipo_conta_id
    fill_in "Vencimento", with: @conta.vencimento
    click_on "Create Conta"

    assert_text "Conta was successfully created"
    click_on "Back"
  end

  test "should update Conta" do
    visit conta_url(@conta)
    click_on "Edit this conta", match: :first

    check "Ativo" if @conta.ativo
    fill_in "Fim", with: @conta.fim
    fill_in "Inicio", with: @conta.inicio
    fill_in "N parc", with: @conta.n_parc
    fill_in "Nome", with: @conta.nome
    check "Pago" if @conta.pago
    fill_in "Tipo conta", with: @conta.tipo_conta_id
    fill_in "Vencimento", with: @conta.vencimento
    click_on "Update Conta"

    assert_text "Conta was successfully updated"
    click_on "Back"
  end

  test "should destroy Conta" do
    visit conta_url(@conta)
    click_on "Destroy this conta", match: :first

    assert_text "Conta was successfully destroyed"
  end
end
