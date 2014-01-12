# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :section, :class => Dust::Section do

    title {Faker::Lorem.sentence}
    classes {Faker::Lorem.sentence}
    association :page, :factory => :page

  end
end



