Factory.define :knote do |f|
  f.sequence(:title) { |n| "Knote Title #{n}" }
  f.sequence(:body) { |n| "Knote Body #{n}" }
  f.tags { Faker::Lorem.words(4) }
end
