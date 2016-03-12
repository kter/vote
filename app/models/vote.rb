class Vote < ActiveRecord::Base
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, allow_nil: true, allow_blank: true
end
