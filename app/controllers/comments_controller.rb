# frozen_string_literal: true

class CommentsController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
  end

  def create
    authenticate_user!

    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:success] = t('.success')
    else
      flash[:error] = @comment.errors.full_messages.join('. ')
    end

    redirect_to @post
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content parent_id])
  end
end
