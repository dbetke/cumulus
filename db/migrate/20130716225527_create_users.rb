class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :cookie,
      t.string :name,
      t.text, :box1
      t.text, :box2
      t.text :pay_pal

      t.timestamps
    end
  end
end
