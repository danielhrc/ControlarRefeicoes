require "application_system_test_case"

class UserHasRefeicaosTest < ApplicationSystemTestCase
  setup do
    @user_has_refeicao = user_has_refeicaos(:one)
  end

  test "visiting the index" do
    visit user_has_refeicaos_url
    assert_selector "h1", text: "User Has Refeicaos"
  end

  test "creating a User has refeicao" do
    visit user_has_refeicaos_url
    click_on "New User Has Refeicao"

    fill_in "Refeicao", with: @user_has_refeicao.refeicao_id
    fill_in "User", with: @user_has_refeicao.user_id
    click_on "Create User has refeicao"

    assert_text "User has refeicao was successfully created"
    click_on "Back"
  end

  test "updating a User has refeicao" do
    visit user_has_refeicaos_url
    click_on "Edit", match: :first

    fill_in "Refeicao", with: @user_has_refeicao.refeicao_id
    fill_in "User", with: @user_has_refeicao.user_id
    click_on "Update User has refeicao"

    assert_text "User has refeicao was successfully updated"
    click_on "Back"
  end

  test "destroying a User has refeicao" do
    visit user_has_refeicaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User has refeicao was successfully destroyed"
  end
end
