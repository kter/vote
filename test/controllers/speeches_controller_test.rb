require 'test_helper'

class SpeechesControllerTest < ActionController::TestCase
  setup do
    @speech = speeches("1st_speech")
    @user = users(:miku)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:speeches)
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should create speech" do
    log_in_as(@user)
    assert_difference('Speech.count') do
      post :create, speech: { hold_date: @speech.hold_date, presenter1: @speech.presenter1, presenter2: @speech.presenter2, theme1: @speech.theme1, theme2: @speech.theme2 }
    end

    assert_redirected_to speech_path(assigns(:speech))
  end

  test "should show speech" do
    get :show, id: @speech
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get :edit, id: @speech
    assert_response :success
  end

  test "should update speech" do
    log_in_as(@user)
    patch :update, id: @speech, speech: { hold_date: @speech.hold_date, presenter1: @speech.presenter1, presenter2: @speech.presenter2, theme1: @speech.theme1, theme2: @speech.theme2 }
    assert_redirected_to speech_path(assigns(:speech))
  end

  test "should destroy speech" do
    log_in_as(@user)
    assert_difference('Speech.count', -1) do
      delete :destroy, id: @speech
    end

    assert_redirected_to speeches_path
  end
end
