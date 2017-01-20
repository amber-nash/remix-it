class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :email, null: false
      t.text :password_hash, null: false
    end
  end
end
