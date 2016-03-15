require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  def setup
    @vote = Vote.new(comment: "comment", score: 3, presenter: "akari.mamiya", hold_date: "2016-03-05")
  end

  test "should be valid" do
    assert @vote.valid?
  end

  test "presenter should be present" do
    @vote.presenter = nil
    assert_not @vote.valid?
  end

  test "score should not be  grather than or equal to 1" do
    @vote.score = 0
    assert_not @vote.valid?
  end

  test "score should not be less than or equal to 3" do
    @vote.score = 4
    assert_not @vote.valid?
  end

end
