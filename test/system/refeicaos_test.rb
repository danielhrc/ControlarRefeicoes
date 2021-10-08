require "application_system_test_case"

class RefeicaosTest < ApplicationSystemTestCase
  setup do
    @refeicao = refeicaos(:one)
  end

  test "visiting the index" do
    visit refeicaos_url
    assert_selector "h1", text: "Refeicaos"
  end

  test "creating a Refeicao" do
    visit refeicaos_url
    click_on "New Refeicao"

    fill_in "Alimentos", with: @refeicao.alimentos
    fill_in "Hora", with: @refeicao.hora
    fill_in "Sentimento", with: @refeicao.sentimento
    fill_in "Tipo", with: @refeicao.tipo
    click_on "Create Refeicao"

    assert_text "Refeicao was successfully created"
    click_on "Back"
  end

  test "updating a Refeicao" do
    visit refeicaos_url
    click_on "Edit", match: :first

    fill_in "Alimentos", with: @refeicao.alimentos
    fill_in "Hora", with: @refeicao.hora
    fill_in "Sentimento", with: @refeicao.sentimento
    fill_in "Tipo", with: @refeicao.tipo
    click_on "Update Refeicao"

    assert_text "Refeicao was successfully updated"
    click_on "Back"
  end

  test "destroying a Refeicao" do
    visit refeicaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Refeicao was successfully destroyed"
  end
end
