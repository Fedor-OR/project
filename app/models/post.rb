class Post < ApplicationRecord
    # has_many :comments, dependent: :destroy
    # validates :author, presense: true
    # after_commit :post_created_mail, on: :create
    # after_commit :post_updated_mail, on: :update
end
