FactoryBot.define do
  factory :blog_comment do
    blog { 1 }
    user { 1 }
    content { "test_comment" }
  end
end
