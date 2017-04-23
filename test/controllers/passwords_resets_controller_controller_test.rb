require 'test_helper'

class PasswordsResetsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get passwords_resets_controller_new_url
    assert_response :success
  end

  test "should get update" do
    get passwords_resets_controller_update_url
    assert_response :success
  end

  test "should get create" do
    get passwords_resets_controller_create_url
    assert_response :success
  end

  test "should get edit" do
    get passwords_resets_controller_edit_url
    assert_response :success
  end

end
