# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :page, :class => Dust::Page do

    meta_title {Faker::Lorem.sentence}
    meta_description {Faker::Lorem.sentence}
    classes {Faker::Lorem.sentence}

    filename {Faker::Internet.slug}
    active true
    nav_link {Faker::Lorem.sentence}
    menu {Faker::Number.digit}

  end
end

