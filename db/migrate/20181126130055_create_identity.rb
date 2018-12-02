class CreateIdentity < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_active
      t.datetime :last_verify_at

      t.timestamps
    end
  end
end
