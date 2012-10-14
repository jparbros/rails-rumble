class Comment < ActiveRecord::Base
  attr_accessible :author_id, :comment, :commentable_id, :commentable_type
  belongs_to :commentable, :polymorphic => true
end