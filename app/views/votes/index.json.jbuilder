json.array!(@votes) do |vote|
  json.extract! vote, :id, :hold_date, :presenter, :score, :comment
  json.url vote_url(vote, format: :json)
end
