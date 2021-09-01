class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: %i[show create edit update destroy ]
  before_action :is_authorized_user, only: %i[update destroy ]
  before_action :is_public?, only: %i[show]
  # GET /posts
  def index
    @posts = Post.all

    render json: @posts.map{|post|
      if post.is_private == false 
         post.as_json().merge(image_path: url_for(post.image), username: post.user.name)
      end
    }
  end

  # GET /posts/1
  def show
    render json: @post.as_json().merge(image_path: url_for(@post.image)), status: :created, location: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
        render json: @post.as_json().merge(image_path: url_for(@post.image)), status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :user_id)
    end
    def is_public?
      if  @post.is_private == false ||  user_signed_in? && is_authorized_user
        return true 
      else
        unauthorized
      end 
    end
    def is_authorized_user
      if user_signed_in? && @post.user_id == current_user.id 
        return true 
      else
        unauthorized
      end 
    end
end
