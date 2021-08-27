FactoryBot.define do
  factory :user do
    name { 'test1' }
    email { 'test1@email.com' }
    password { 'test123' }
    password_confirmation { 'test123' }
    address { 1 }
    teeth_type { 3 }
    orthodontics_type { 7 }
    admin { 'false' }
    uid { SecureRandom.uuid }
  end

  factory :admin_user, class: User do
    name { 'admin_user' }
    email { 'admin_user@mail.com' }
    password { '9999999' }
    password_confirmation { '9999999' }
    address { 2 }
    teeth_type { 3 }
    orthodontics_type { 5 }
    admin { 'true' }
    uid { SecureRandom.uuid }
  end
end
