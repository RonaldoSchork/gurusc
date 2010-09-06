class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    flash[:alert] = 'Cheque se todos os dados foram corretamente preenchidos.' unless @comment.save
    redirect_to @post
  end
end
