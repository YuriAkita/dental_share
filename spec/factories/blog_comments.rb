FactoryBot.define do
  factory :blog_comment do
    blog { nil }
    user { nil }
    content { "MyText" }
  end
end
