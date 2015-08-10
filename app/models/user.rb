class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   belongs_to :followable, :class_name => 'Follow', :polymorphic => true
   belongs_to :follower, :class_name => 'Follow', :polymorphic => true

   has_many :posts

   acts_as_followable
   acts_as_follower


end
