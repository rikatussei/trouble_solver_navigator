FactoryBot.define do
  factory :event do
    title                 { '出来事' }
    description           { '出来事の説明' }
    occurred_on           { Faker::Date.between(from: '1990-01-01', to: '2000-12-31') }
    location              { "工場" }
    cause_type_id         { 2 }
    detailed_cause        { "点検時の作業ミス" }
    resolution            { "点検時に作業のチェックを充実させた。" }
    association :user

    after(:build) do |event|
      event.images.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/sample_image.jpg')),
        filename: 'sample_image.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
