class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   belongs_to :followable, :class_name => 'Follow', :polymorphic => true
   belongs_to :follower, :class_name => 'Follow', :polymorphic => true

   has_many :posts
   has_many :follows, :through => :passive_follows, :as => :followable_id
   has_many :followers, :through => :active_follows, :as => :follower_id
   acts_as_followable
   acts_as_follower


end
