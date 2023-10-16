class MoveBodytoActionText < ActiveRecord::Migration[7.0]
  def change
    Blog.all.find_each do |blog|
      blog.update(content: blog.body)
    end
    
    remove_column :blogs, :body
  end
end
