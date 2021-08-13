FactoryBot.define do
  factory :review do 
    association :user, factory: :user
    clinic_id { 1 }
    reservation_at { '2020/11/01' }
    quote_price { 1 }
    orthodontics_type { 1 }
    content { "review_test" }
    star { 1 }
  end
end
