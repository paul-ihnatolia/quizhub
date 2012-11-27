require 'test_helper'

class PollCategoriesControllerTest < ActionController::TestCase
  setup do
    @poll_category = poll_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_category" do
    assert_difference('PollCategory.count') do
      post :create, poll_category: { string: @poll_category.string }
    end

    assert_redirected_to poll_category_path(assigns(:poll_category))
  end

  test "should show poll_category" do
    get :show, id: @poll_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll_category
    assert_response :success
  end

  test "should update poll_category" do
    put :update, id: @poll_category, poll_category: { string: @poll_category.string }
    assert_redirected_to poll_category_path(assigns(:poll_category))
  end

  test "should destroy poll_category" do
    assert_difference('PollCategory.count', -1) do
      delete :destroy, id: @poll_category
    end

    assert_redirected_to poll_categories_path
  end
end
