require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout Links" do
    get root_path # obtem a rota raiz
    assert_template 'static_pages/home' # verifica se esta pagina esta processando a view correta
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get signup_path

    # pedente de implementação "test/helpers/application_helper_test.rb"
    # assert_select "title", full_title("Contact")
  end
end
