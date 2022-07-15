class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user 
    has_many :likes, dependent: :destroy
    has_one_attached :photo
    # validates :author, presense: true
    # after_commit :post_created_mail, on: :create
    # after_commit :post_updated_mail, on: :update
end
