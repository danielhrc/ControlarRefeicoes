require "test_helper"

class UserHasRefeicaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_has_refeicao = user_has_refeicaos(:one)
  end

  test "should get index" do
    get user_has_refeicaos_url
    assert_response :success
  end

  test "should get new" do
    get new_user_has_refeicao_url
    assert_response :success
  end

  test "should create user_has_refeicao" do
    assert_difference('UserHasRefeicao.count') do
      post user_has_refeicaos_url, params: { user_has_refeicao: { refeicao_id: @user_has_refeicao.refeicao_id, user_id: @user_has_refeicao.user_id } }
    end

    assert_redirected_to user_has_refeicao_url(UserHasRefeicao.last)
  end

  test "should show user_has_refeicao" do
    get user_has_refeicao_url(@user_has_refeicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_has_refeicao_url(@user_has_refeicao)
    assert_response :success
  end

  test "should update user_has_refeicao" do
    patch user_has_refeicao_url(@user_has_refeicao), params: { user_has_refeicao: { refeicao_id: @user_has_refeicao.refeicao_id, user_id: @user_has_refeicao.user_id } }
    assert_redirected_to user_has_refeicao_url(@user_has_refeicao)
  end

  test "should destroy user_has_refeicao" do
    assert_difference('UserHasRefeicao.count', -1) do
      delete user_has_refeicao_url(@user_has_refeicao)
    end

    assert_redirected_to user_has_refeicaos_url
  end
end
