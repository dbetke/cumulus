class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.int, :user_id
      t.int, :tag_id
      t.int :weight

      t.timestamps
    end
  end
end
