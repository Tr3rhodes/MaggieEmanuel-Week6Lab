class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true
  validates_length_of :body, maximum: 170


  def self.timeline(user)
    following_ids = user.all_following.map(&:id)
    all_ids = following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

end
