class CreatePostCategoriesPosts < ActiveRecord::Migration
  def self.up
    create_table "post_categories_posts", :id => false, :force => true do |t|
      t.integer "post_id",          :null => false
      t.integer "post_category_id", :null => false
    end
  end

  def self.down
    drop :post_categories_posts
  end
end
