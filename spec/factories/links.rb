# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
    user nil
    short_url "MyString"
    thumbnail "MyString"
    promoted false
    category "MyString"
  end
end
