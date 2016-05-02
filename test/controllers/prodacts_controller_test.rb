require 'test_helper'

class ProdactsControllerTest < ActionController::TestCase
  setup do
    @prodact = prodacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prodacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prodact" do
    assert_difference('Prodact.count') do
      post :create, prodact: {  }
    end

    assert_redirected_to prodact_path(assigns(:prodact))
  end

  test "should show prodact" do
    get :show, id: @prodact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prodact
    assert_response :success
  end

  test "should update prodact" do
    patch :update, id: @prodact, prodact: {  }
    assert_redirected_to prodact_path(assigns(:prodact))
  end

  test "should destroy prodact" do
    assert_difference('Prodact.count', -1) do
      delete :destroy, id: @prodact
    end

    assert_redirected_to prodacts_path
  end
end
