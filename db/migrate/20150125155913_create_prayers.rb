class CreatePrayers < ActiveRecord::Migration
  def change
    create_table :prayers do |t|
      t.integer :user_id, null: false
      t.boolean :anonymous, null: false, default: false
      t.text :body, null: false
      t.text :title, null: false

      t.timestamps null: false
    end

    add_index :prayers, :user_id
  end
end
