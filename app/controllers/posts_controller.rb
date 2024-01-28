# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  before_action :set_post, only: %i[show]

  def index
    @posts = Post.includes(:category, :creator).order(created_at: :desc)
  end

  def show
    @comments = @post.comments.includes(:user).arrange(order: { created_at: :desc })
    @form_comment = current_user&.comments&.build
    @user_like = @post.likes.find_by(user: current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(creator: current_user))

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.includes(:category, :creator).find(params[:post_id] || params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
