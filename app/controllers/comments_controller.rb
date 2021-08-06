class CommentsController < ApplicationController
  def create
    comment = Comment.new
    if session.fetch(:user_id)
      comment.author_id = session.fetch(:user_id)
      comment.photo_id = params.fetch("input_photo_id")
      comment.body = params.fetch("input_body")
      comment.save
      redirect_to("/photos/#{comment.photo_id}")
    else
      redirect_to("/user_sign_in", {:alert => "Please login first!"})
    end
  end
end
