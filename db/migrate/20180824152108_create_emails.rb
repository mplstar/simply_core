class CreateEmails < ActiveRecord::Migration[4.2]
  def change
    create_table :emails do |t|
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
