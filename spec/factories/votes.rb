# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    link nil
    user nil
    score 1
  end
end
