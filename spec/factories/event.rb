FactoryBot.define do
  factory :event do
    text {"hello!"}
    image {"hoge.png"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end