require 'test_helper'

class SellingsControllerTest < ActionController::TestCase
  setup do
    @selling = sellings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sellings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selling" do
    assert_difference('Selling.count') do
      post :create, selling: {  }
    end

    assert_redirected_to selling_path(assigns(:selling))
  end

  test "should show selling" do
    get :show, id: @selling
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selling
    assert_response :success
  end

  test "should update selling" do
    patch :update, id: @selling, selling: {  }
    assert_redirected_to selling_path(assigns(:selling))
  end

  test "should destroy selling" do
    assert_difference('Selling.count', -1) do
      delete :destroy, id: @selling
    end

    assert_redirected_to sellings_path
  end
end
