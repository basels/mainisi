class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, :limit => 32
      t.string :email, :limit => 64
      t.timestamps
    end
  end
end
