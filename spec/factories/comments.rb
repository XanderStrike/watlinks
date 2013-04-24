# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    contents "MyString"
    user "MyString"
    post "MyString"
  end
end
