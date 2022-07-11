class IdAuthorToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :user, foreing_key: true
  end
end
