class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :video_id, null: false
      t.string :body, null: false
      t.integer :video_time, null: false
      t.integer :likes, null: false
      t.integer :dislikes, null: false

      t.timestamps
    end

    add_index :comments, :video_id
  end
end
