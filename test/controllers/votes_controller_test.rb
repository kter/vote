require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
    @vote2 = votes(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote" do
    assert_difference('Vote.count', 2) do
      post :create, vote: {
        comment1: @vote.comment,
        comment2: @vote2.comment,
        hold_date1: @vote.hold_date,
        hold_date2: @vote2.hold_date,
        presenter1: @vote.presenter,
        presenter2: @vote2.presenter,
        score1: @vote.score,
        score2: @vote2.score
      }
    end

    assert_redirected_to root_path
  end

  test "should show vote" do
    get :show, id: @vote
    assert_response :success
  end

  test "should update vote" do
    patch :update, id: @vote, vote: { comment: @vote.comment, hold_date: @vote.hold_date, presenter: @vote.presenter, score: @vote.score }
    assert_redirected_to vote_path(assigns(:vote))
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote
    end

    assert_redirected_to votes_path
  end
end
