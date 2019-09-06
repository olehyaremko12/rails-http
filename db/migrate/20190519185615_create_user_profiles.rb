class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string     :username, uniq: true
      t.string     :first_name
      t.string     :last_name
      t.date       :birthday
      t.string     :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
