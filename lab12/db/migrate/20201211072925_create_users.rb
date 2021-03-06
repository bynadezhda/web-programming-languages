class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.datetime :last_login_at

      t.timestamps
    end
    add_index :users, :username
  end
end
