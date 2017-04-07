require 'test_helper'

class Admin::CityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_city_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_city_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_city_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_city_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_city_delete_url
    assert_response :success
  end

end
