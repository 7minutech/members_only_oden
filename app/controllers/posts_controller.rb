class PostsController < ApplicationController
  before_action :require_login, except: [ :index ]
  def index
    @posts = Post.all.sort_by(&:created_at)
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_login
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
