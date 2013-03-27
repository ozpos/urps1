require 'test_helper'

class ControllerNamesControllerTest < ActionController::TestCase
  setup do
    @controller_name = controller_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:controller_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create controller_name" do
    assert_difference('ControllerName.count') do
      post :create, controller_name: { name: @controller_name.name }
    end

    assert_redirected_to controller_name_path(assigns(:controller_name))
  end

  test "should show controller_name" do
    get :show, id: @controller_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @controller_name
    assert_response :success
  end

  test "should update controller_name" do
    put :update, id: @controller_name, controller_name: { name: @controller_name.name }
    assert_redirected_to controller_name_path(assigns(:controller_name))
  end

  test "should destroy controller_name" do
    assert_difference('ControllerName.count', -1) do
      delete :destroy, id: @controller_name
    end

    assert_redirected_to controller_names_path
  end
end
