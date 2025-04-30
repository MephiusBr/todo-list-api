FactoryBot.define do
  factory :task do
    name { Faker::Company.industry }

    trait :with_content do
      content { Faker::Lorem.paragraph(sentence_count: 5) }
    end
  end
end
