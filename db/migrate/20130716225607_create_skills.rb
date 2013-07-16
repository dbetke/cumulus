class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :user_id
      t.integer :tag_id
      t.integer :weight

      t.timestamps
    end
  end
end
