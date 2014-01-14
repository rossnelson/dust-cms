# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :block, :class => Dust::Block do

    title {Faker::Lorem.sentence(3)}
    body {Faker::Lorem.paragraph}
    classes {Faker::Lorem.sentence(2)}

    partial_name ""
    where_to_show ""
    show {
      ["/#{Faker::Internet.slug(nil, "-")}", 
      "/#{Faker::Internet.slug(nil, "-")}"].join("\r\n")
    }
    show_title false
    weight {Faker::Number.digit}
    column_span ""
    column_offset ""

  end
end


