class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.text :content, :limit => 512
      t.integer :user_id
      t.timestamps
    end
  end
end
