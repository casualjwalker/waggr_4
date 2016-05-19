class Post < ActiveRecord::Base


  belongs_to :user
  
  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }

  default_scope -> { order('created_at DESC') }

  mount_uploader :attachment, AvatarUploader

  validates_presence_of :content
  validates_presence_of :user


  
end

