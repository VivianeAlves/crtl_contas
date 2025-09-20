require "application_system_test_case"

class TipoContasTest < ApplicationSystemTestCase
  setup do
    @tipo_conta = tipo_contas(:one)
  end

  test "visiting the index" do
    visit tipo_contas_url
    assert_selector "h1", text: "Tipo contas"
  end

  test "should create tipo conta" do
    visit tipo_contas_url
    click_on "New tipo conta"

    fill_in "Nome", with: @tipo_conta.nome
    click_on "Create Tipo conta"

    assert_text "Tipo conta was successfully created"
    click_on "Back"
  end

  test "should update Tipo conta" do
    visit tipo_conta_url(@tipo_conta)
    click_on "Edit this tipo conta", match: :first

    fill_in "Nome", with: @tipo_conta.nome
    click_on "Update Tipo conta"

    assert_text "Tipo conta was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo conta" do
    visit tipo_conta_url(@tipo_conta)
    click_on "Destroy this tipo conta", match: :first

    assert_text "Tipo conta was successfully destroyed"
  end
end
