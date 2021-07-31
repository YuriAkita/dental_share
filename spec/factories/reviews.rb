FactoryBot.define do
  factory :review do
    reservation_at { "2021-07-31 14:08:31" }
    quote_price { 1 }
    orthodontics_type { 1 }
    content { "MyText" }
    star { 1 }
    user { nil }
  end
end
