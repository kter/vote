require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:miku)
  end

  test "login with invalid information" do
    get admin_login_path
    assert_template 'sessions/new'
    post admin_login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get admin_login_path
    post admin_login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'top/index'
    assert_select "a[href=?]", admin_login_path, count: 0
    assert_select "a[href=?]", admin_logout_path
    delete admin_logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # 2番目のウィンドウでログアウトをクリックするユーザーをシミュレートする
    delete admin_logout_path
    follow_redirect!
    assert_select "a[href=?]", admin_login_path
    assert_select "a[href=?]", admin_logout_path,      count: 0
  end
end
