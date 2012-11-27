require 'test_helper'

class PollBoardsControllerTest < ActionController::TestCase
  setup do
    @poll_board = poll_boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_boards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_board" do
    assert_difference('PollBoard.count') do
      post :create, poll_board: {  }
    end

    assert_redirected_to poll_board_path(assigns(:poll_board))
  end

  test "should show poll_board" do
    get :show, id: @poll_board
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll_board
    assert_response :success
  end

  test "should update poll_board" do
    put :update, id: @poll_board, poll_board: {  }
    assert_redirected_to poll_board_path(assigns(:poll_board))
  end

  test "should destroy poll_board" do
    assert_difference('PollBoard.count', -1) do
      delete :destroy, id: @poll_board
    end

    assert_redirected_to poll_boards_path
  end
end
