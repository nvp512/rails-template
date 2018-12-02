class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.integer :member_id
      t.string :token
      t.boolean :is_used, default: false
      t.datetime :expire_at
      t.string :type

      t.timestamps
    end
  end
end
