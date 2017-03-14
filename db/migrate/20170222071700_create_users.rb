class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name,      null: false
      t.string :last_name,      null: false
      t.string :email,      null: false, unique: true
      t.string :email_notifications_opt
      t.string :cell_phone
      t.string :sms_notifications_opt
      t.string :password
      t.string :password_confirmation
      t.boolean :enabled

      t.timestamps
    end
  end
end
