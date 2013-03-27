require 'test_helper'

class ControllerActionsControllerTest < ActionController::TestCase
  setup do
    @controller_action = controller_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:controller_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create controller_action" do
    assert_difference('ControllerAction.count') do
      post :create, controller_action: { name: @controller_action.name }
    end

    assert_redirected_to controller_action_path(assigns(:controller_action))
  end

  test "should show controller_action" do
    get :show, id: @controller_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @controller_action
    assert_response :success
  end

  test "should update controller_action" do
    put :update, id: @controller_action, controller_action: { name: @controller_action.name }
    assert_redirected_to controller_action_path(assigns(:controller_action))
  end

  test "should destroy controller_action" do
    assert_difference('ControllerAction.count', -1) do
      delete :destroy, id: @controller_action
    end

    assert_redirected_to controller_actions_path
  end
end
