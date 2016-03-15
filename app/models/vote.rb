class Vote < ActiveRecord::Base
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3}
  validates :presenter, presence: true
end
