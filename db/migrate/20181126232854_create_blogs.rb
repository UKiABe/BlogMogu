class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.integer :category, default: 0
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
