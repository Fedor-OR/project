class AddReferenseToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :body, :string
    add_reference :comments, :user, foreing_key: true
    add_reference :comments, :post, foreing_key: true
  end
end
