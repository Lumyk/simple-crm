require 'test_helper'

class SkladsControllerTest < ActionController::TestCase
  setup do
    @sklad = sklads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sklads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sklad" do
    assert_difference('Sklad.count') do
      post :create, sklad: {  }
    end

    assert_redirected_to sklad_path(assigns(:sklad))
  end

  test "should show sklad" do
    get :show, id: @sklad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sklad
    assert_response :success
  end

  test "should update sklad" do
    patch :update, id: @sklad, sklad: {  }
    assert_redirected_to sklad_path(assigns(:sklad))
  end

  test "should destroy sklad" do
    assert_difference('Sklad.count', -1) do
      delete :destroy, id: @sklad
    end

    assert_redirected_to sklads_path
  end
end
