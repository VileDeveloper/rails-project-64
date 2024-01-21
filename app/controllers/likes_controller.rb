# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_post, only: %i[create destroy]

  def create
    like = @post.likes.build(like_params)
    flash[:error] = t('.error') unless like.save

    redirect_to referer_or_post_url(@post)
  end

  def destroy
    flash[:error] = t('.error') unless @post.liked(current_user)&.destroy
    redirect_to referer_or_post_url(@post)
  end

  private

  def like_params
    { user_id: current_user.id }.merge(params.permit(:post_id))
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def referer_or_post_url(post)
    request.referer || post
  end
end
