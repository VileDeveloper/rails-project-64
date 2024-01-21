# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[create show]

  def show; end

  def create
    create_build

    if @comment.save
      redirect_to post_path(@comment.post_id, anchor: "post_comment_#{@comment.id}"), notice: t('.success')
    else
      flash[:error] = t('.error')
      redirect_to post_path(@comment.post_id)
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content parent_id])
  end

  def create_build
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
