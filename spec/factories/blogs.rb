FactoryBot.define do
  factory :blog do
    content { "test_blog_content" }
    user { 1 }
  end
end
