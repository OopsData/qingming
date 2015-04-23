require 'test_helper'

class ChangzousControllerTest < ActionController::TestCase
  setup do
    @changzou = changzous(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:changzous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create changzou" do
    assert_difference('Changzou.count') do
      post :create, changzou: { mobile: @changzou.mobile, name: @changzou.name }
    end

    assert_redirected_to changzou_path(assigns(:changzou))
  end

  test "should show changzou" do
    get :show, id: @changzou
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @changzou
    assert_response :success
  end

  test "should update changzou" do
    patch :update, id: @changzou, changzou: { mobile: @changzou.mobile, name: @changzou.name }
    assert_redirected_to changzou_path(assigns(:changzou))
  end

  test "should destroy changzou" do
    assert_difference('Changzou.count', -1) do
      delete :destroy, id: @changzou
    end

    assert_redirected_to changzous_path
  end
end
