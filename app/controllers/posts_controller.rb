# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy edit new update]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where.not(creator_id: nil)
                 .includes(:category, :creator)
                 .order(created_at: :desc)
  end

  def show
    @comments = @post.comments.where.not(user_id: nil)
                     .includes(:user)
                     .arrange(order: :created_at)
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params.merge(creator: current_user))

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_url, notice: t('.success')
    else
      flash[:error] = t('.error')
      render @post, status: :unprocessable_entity
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
