json.array!(@speeches) do |speech|
  json.extract! speech, :id, :hold_date, :presenter1, :presenter2, :theme1, :theme2, :RAILS_ENV=development
  json.url speech_url(speech, format: :json)
end
