require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
    @vote2 = votes(:two)
    @vote3 = votes(:three)
    @vote4 = votes(:four)
    @user = users(:miku)
  end

  test "should get index" do
    log_in_as(@user)
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
    log_in_as(@user)
    get :show, id: @vote
    assert_response :success
  end

  test "should update vote" do
    log_in_as(@user)
    patch :update, id: @vote, vote: { comment: @vote.comment, hold_date: @vote.hold_date, presenter: @vote.presenter, score: @vote.score }
    assert_redirected_to vote_path(assigns(:vote))
  end

  test "should destroy vote" do
    log_in_as(@user)
    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote
    end

    assert_redirected_to votes_path
  end

  test "should fail with invalid score" do
      post :create, vote: {
        comment1: @vote3.comment,
        comment2: @vote4.comment,
        hold_date1: @vote3.hold_date,
        hold_date2: @vote4.hold_date,
        presenter1: @vote3.presenter,
        presenter2: @vote4.presenter,
        score1: @vote3.score,
        score2: @vote4.score
      }
      assert_template 'votes/new'
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @vote
    assert_not flash.empty?
    assert_redirected_to admin_login_path
  end

  test "should redirect index when not logged in" do
    get :index
    assert_not flash.empty?
    assert_redirected_to admin_login_path
  end

  test "should redirect show when not logged in" do
    get :show, id: @vote
    assert_not flash.empty?
    assert_redirected_to admin_login_path
  end

  test "should redirect update when not logged in" do
    patch :update, id: @vote, vote: { comment: @vote.comment, hold_date: @vote.hold_date, presenter: @vote.presenter, score: @vote.score }
    assert_not flash.empty?
    assert_redirected_to admin_login_path
  end

  test "should redirect destroy when not logged in" do
    delete :destroy, id: @vote
    assert_not flash.empty?
    assert_redirected_to admin_login_path
  end
end
