require "test_helper"

class RefeicaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @refeicao = refeicaos(:one)
  end

  test "should get index" do
    get refeicaos_url
    assert_response :success
  end

  test "should get new" do
    get new_refeicao_url
    assert_response :success
  end

  test "should create refeicao" do
    assert_difference('Refeicao.count') do
      post refeicaos_url, params: { refeicao: { alimentos: @refeicao.alimentos, hora: @refeicao.hora, sentimento: @refeicao.sentimento, tipo: @refeicao.tipo } }
    end

    assert_redirected_to refeicao_url(Refeicao.last)
  end

  test "should show refeicao" do
    get refeicao_url(@refeicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_refeicao_url(@refeicao)
    assert_response :success
  end

  test "should update refeicao" do
    patch refeicao_url(@refeicao), params: { refeicao: { alimentos: @refeicao.alimentos, hora: @refeicao.hora, sentimento: @refeicao.sentimento, tipo: @refeicao.tipo } }
    assert_redirected_to refeicao_url(@refeicao)
  end

  test "should destroy refeicao" do
    assert_difference('Refeicao.count', -1) do
      delete refeicao_url(@refeicao)
    end

    assert_redirected_to refeicaos_url
  end
end
