# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :knotebook do |f|
  f.sequence(:title) { |n| "Knotebook Title #{n}" }
  f.sequence(:abstract) { |n| "Knotebook Abstract #{n}" }
end
