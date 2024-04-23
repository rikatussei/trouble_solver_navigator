FactoryBot.define do
  factory :user do
    nickname              { '鈴木 太郎' }
    email                 { Faker::Internet.email }
    password              { '1234test' }
    password_confirmation { password }
    last_name             { '鈴木' }
    first_name            { '太郎' }
    affiliation           { "技術部" }
  end
end
