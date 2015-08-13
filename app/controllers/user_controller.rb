
class UserController < ApplicationController
  attr_accessor :email, :username, :user_bio, :user_photo

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
      if current_user == @user
        respond_to do |format|
          format.html {flash[:notice] = "You are cannot follow yourself"}
          format.js { }
          redirect_to :posts

        end
      else
        respond_to do |format|
          format.html {current_user.follow(@user)}
          format.js {  }
      end
      # change logic js
      redirect_to :posts
    end
  end

  def unfollow
    @user = User.find(params[:id])
      respond_to do |format|
          format.html {current_user.stop_following(@user)}
          format.js { render :follow }
          # change logic js
          redirect_to :posts
      end
  end
end
