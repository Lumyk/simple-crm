require 'test_helper'

class SateTypesControllerTest < ActionController::TestCase
  setup do
    @sate_type = sate_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sate_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sate_type" do
    assert_difference('SateType.count') do
      post :create, sate_type: {  }
    end

    assert_redirected_to sate_type_path(assigns(:sate_type))
  end

  test "should show sate_type" do
    get :show, id: @sate_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sate_type
    assert_response :success
  end

  test "should update sate_type" do
    patch :update, id: @sate_type, sate_type: {  }
    assert_redirected_to sate_type_path(assigns(:sate_type))
  end

  test "should destroy sate_type" do
    assert_difference('SateType.count', -1) do
      delete :destroy, id: @sate_type
    end

    assert_redirected_to sate_types_path
  end
end
