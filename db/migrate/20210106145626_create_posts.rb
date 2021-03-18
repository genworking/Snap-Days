class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :caption
      t.text :hashword
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
