class ChangePointColumnOnClinic < ActiveRecord::Migration[6.1]
  def change
    change_column_null :clinics, :name, false
    change_column_null :clinics, :address, false
  end
end
