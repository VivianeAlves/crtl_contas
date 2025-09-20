require "test_helper"

class TipoContasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_conta = tipo_contas(:one)
  end

  test "should get index" do
    get tipo_contas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_conta_url
    assert_response :success
  end

  test "should create tipo_conta" do
    assert_difference("TipoConta.count") do
      post tipo_contas_url, params: { tipo_conta: { nome: @tipo_conta.nome } }
    end

    assert_redirected_to tipo_conta_url(TipoConta.last)
  end

  test "should show tipo_conta" do
    get tipo_conta_url(@tipo_conta)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_conta_url(@tipo_conta)
    assert_response :success
  end

  test "should update tipo_conta" do
    patch tipo_conta_url(@tipo_conta), params: { tipo_conta: { nome: @tipo_conta.nome } }
    assert_redirected_to tipo_conta_url(@tipo_conta)
  end

  test "should destroy tipo_conta" do
    assert_difference("TipoConta.count", -1) do
      delete tipo_conta_url(@tipo_conta)
    end

    assert_redirected_to tipo_contas_url
  end
end
