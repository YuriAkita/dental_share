require "csv"
CSV.foreach('db/dental_info.csv', headers: true) do |row|
  Clinic.create(
              id: row['id'],
              name: row['name'],
              address: row['address']
              )
end

User.create!(
  name: "admin",
  email: "admin@mail.com",
  password: "password1",
  admin: true,
  address: 1,
  teeth_type: 1,
  orthodontics_type: 1,
)

User.create!(
  name: "hanako",
  email: "hanako@mail.com",
  password: "password2",
  admin: false,
  address: 2,
  teeth_type: 3,
  orthodontics_type: 8,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman1.jpg"), filename: "woman1.jpg")
)

User.create!(
  name: "yukino",
  email: "yukino@mail.com",
  password: "password3",
  admin: false,
  address: 9,
  teeth_type: 2,
  orthodontics_type: 7,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman2.jpg"), filename: "woman2.jpg")
)

User.create!(
  name: "maki",
  email: "maki@mail.com",
  password: "password4",
  admin: false,
  address: 1,
  teeth_type: 2,
  orthodontics_type: 1,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman3.jpg"), filename: "woman3.jpg")
)

User.create!(
  name: "tomomi",
  email: "tomomi@mail.com",
  password: "password5",
  admin: false,
  address: 1,
  teeth_type: 4,
  orthodontics_type: 7,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman4.jpg"), filename: "woman4.jpg")
)

User.create!(
  name: "hayato",
  email: "hayato@mail.com",
  password: "password6",
  admin: false,
  address: 1,
  teeth_type: 2,
  orthodontics_type: 2,  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/man1.jpg"), filename: "man1.jpg")
)
