class AddImageDataToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :image_data, :text
  end
end
