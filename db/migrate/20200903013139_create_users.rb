class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date   :birthday
      t.string :phone_number
      t.string :email_address
      t.string :user_name
      t.string :password_digest
    end
  end
end
