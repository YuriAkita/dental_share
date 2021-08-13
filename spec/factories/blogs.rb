FactoryBot.define do
  factory :blog do
    association :user, factory: :user
    content { "test_blog_content" }
    after(:build) do |blog|
      blog.images.attach(io: File.open('spec/fixtures/image/teeth3.jpg'), filename: 'teeth3.jpg')
    end
  end
end
