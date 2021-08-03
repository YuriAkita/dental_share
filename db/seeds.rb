require "csv"
CSV.foreach('db/dental_info.csv', headers: true) do |row|
  Clinic.create(
              id: row['id'],
              name: row['name'],
              address: row['address']
              )
end
