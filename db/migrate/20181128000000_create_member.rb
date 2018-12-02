class CreateMember < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :display_name
      t.string :nick_name
      t.string :email
      t.boolean :activated, default: false
      t.boolean :disabled, default: false
      t.boolean :api_disabled, default: false

      t.timestamps
    end
  end
end
