require 'test_helper'

class ActionNamesControllerTest < ActionController::TestCase
  setup do
    @action_name = action_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_name" do
    assert_difference('ActionName.count') do
      post :create, action_name: { name: @action_name.name }
    end

    assert_redirected_to action_name_path(assigns(:action_name))
  end

  test "should show action_name" do
    get :show, id: @action_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @action_name
    assert_response :success
  end

  test "should update action_name" do
    put :update, id: @action_name, action_name: { name: @action_name.name }
    assert_redirected_to action_name_path(assigns(:action_name))
  end

  test "should destroy action_name" do
    assert_difference('ActionName.count', -1) do
      delete :destroy, id: @action_name
    end

    assert_redirected_to action_names_path
  end
end
