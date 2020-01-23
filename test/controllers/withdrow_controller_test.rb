require 'test_helper'

class WithdrowControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get withdrow_edit_url
    assert_response :success
  end

  test "should get update" do
    get withdrow_update_url
    assert_response :success
  end

end
