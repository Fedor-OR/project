class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key 'posts', 'users',column: 'user_id'
    add_foreign_key 'comments', 'users',column: 'user_id'
    add_foreign_key 'comments', 'posts',column: 'post_id'
  end
end
