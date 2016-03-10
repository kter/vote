require 'test_helper'

class VoteCreateTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "open voting page" do
    get new_vote_path
    assert_template 'votes/new'
  end
end
