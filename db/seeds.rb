# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Speech.create!(
  hold_date: "2016-02-05",
  presenter1: "nagara",
  presenter2: "natori",
  theme1: "theme of nagara",
  theme2: "theme of natori"
)

Speech.create!(
  hold_date: "2016-03-05",
  presenter1: "oi",
  presenter2: "kitakami",
  theme1: "theme of oi",
  theme2: "theme of kitakami"
)

Speech.create!(
  hold_date: "2016-04-05",
  presenter1: "kiso",
  presenter2: "tama",
  theme1: "theme of kiso",
  theme2: "theme of tama"
)

Vote.create!(
  hold_date: "2016-04-05",
  presenter: "kiso",
  score: 3,
  comment: "comment for kiso"
)

Vote.create!(
  hold_date: "2016-04-05",
  presenter: "tama",
  score: 3,
  comment: "comment for tama"
)

Vote.create!(
  hold_date: "2016-04-05",
  presenter: "kiso",
  score: 1,
  comment: "comment for kiso 2"
)

Vote.create!(
  hold_date: "2016-04-05",
  presenter: "tama",
  score: 1,
  comment: "comment for tama 2"
)
