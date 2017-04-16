class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :city
      t.string :country
      t.string :phone_numer
      t.string :address
      t.integer :status

      t.timestamps
    end
  end
end
