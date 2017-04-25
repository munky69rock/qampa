# frozen_string_literal: true

class CommentsController < ApplicationController
  include LoginRequirable
  require_login only: [:create]
  before_action :assert_commented_by_current_user, only: %i[edit update]

  def create
    return render 'posts/show' unless current_user.confirmed?

    @comment = Comment.new comment_params
    @post = @comment.post
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render 'posts/show'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post.id)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end

  def assert_commented_by_current_user
    @comment = Comment.find(params[:id])
    return if @comment.by? current_user
    raise ActionController::BadRequest,
          "Attempt to modify other user's comment: user:#{current_user.id},comment:#{@comment.id}"
  end
end
