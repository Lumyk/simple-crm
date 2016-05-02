require 'test_helper'

class AtStoresControllerTest < ActionController::TestCase
  setup do
    @at_store = at_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:at_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create at_store" do
    assert_difference('AtStore.count') do
      post :create, at_store: {  }
    end

    assert_redirected_to at_store_path(assigns(:at_store))
  end

  test "should show at_store" do
    get :show, id: @at_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @at_store
    assert_response :success
  end

  test "should update at_store" do
    patch :update, id: @at_store, at_store: {  }
    assert_redirected_to at_store_path(assigns(:at_store))
  end

  test "should destroy at_store" do
    assert_difference('AtStore.count', -1) do
      delete :destroy, id: @at_store
    end

    assert_redirected_to at_stores_path
  end
end
