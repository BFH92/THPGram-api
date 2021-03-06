class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :is_private
      t.timestamps
    end
  end
end
