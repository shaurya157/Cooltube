class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.integer :user_id, null: false
      t.integer :likes, null: false
      t.integer :dislikes, null: false
      t.string :title, null: false
      t.string :description
      t.integer :views, null: false
      t.string :URL, null: false
      t.string :youtube_url

      t.timestamps
    end

    add_index :videos, :title
    add_index :videos, :URL, unique: true
  end
end
