require 'faker'

FactoryGirl.define do
  factory :section_attrs, :class => Hash do
    sections {{
      "1" => {
        "title" => Faker::Lorem.sentence(3),
        "classes" => Faker::Lorem.sentence(2),
        "_destroy" => "0"
      }
    }}

    initialize_with { attributes } 
  end
end
