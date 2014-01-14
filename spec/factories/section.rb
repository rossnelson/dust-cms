# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :section, :class => Dust::Section do

    title {Faker::Lorem.sentence(3)}
    classes {Faker::Lorem.sentence(2)}
    association :page, :factory => :page

  end
end



