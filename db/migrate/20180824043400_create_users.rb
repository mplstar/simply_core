class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :token
      t.integer :email_sent_count
      t.timestamp :last_email_sent

      t.timestamps
    end
  end
end
