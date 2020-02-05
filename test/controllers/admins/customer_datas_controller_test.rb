require 'test_helper'

class Admins::CustomerDatasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_customer_datas_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_customer_datas_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_customer_datas_update_url
    assert_response :success
  end

end
