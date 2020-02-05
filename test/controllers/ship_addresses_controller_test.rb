require 'test_helper'

class ShipAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ship_addresses_index_url
    assert_response :success
  end

  test "should get create" do
    get ship_addresses_create_url
    assert_response :success
  end

  test "should get edit" do
    get ship_addresses_edit_url
    assert_response :success
  end

  test "should get update" do
    get ship_addresses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ship_addresses_destroy_url
    assert_response :success
  end

end
