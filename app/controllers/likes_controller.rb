# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    authenticate_user!

    @post = Post.find(params[:post_id])
    @post.likes.find_or_create_by(user: current_user)

    redirect_to @post
  end

  def destroy
    authenticate_user!

    @post = Post.find(params[:post_id])
    @post.like_by_user(current_user)&.destroy

    redirect_to @post
  end
end
