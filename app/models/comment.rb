class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user

  def post
    commentable.is_a?(Post) ? commentable : commentable.post
  end

end