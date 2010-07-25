# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :kopy do |f|
  f.sequence(:title) { |n| "Knote Title #{n}" }
  f.sequence(:body) { |n| "Knote Body #{n}" }
  f.association :knote
end
