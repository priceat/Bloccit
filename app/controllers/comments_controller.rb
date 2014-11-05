class CommentsController < ApplicationController
  respond_to :html, :js
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@post.topic,@post]
    else
      flash[:error] = "Comment failed to save."
      redirect_to [@post.topic,@post]
    end
  end

  def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])

     authorize @comment
 
     if @comment.destroy
       flash[:notice] = "Comment was deleted successfully."
       
     else
       flash[:error] = "There was an error deleting the comment."
     end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post]}
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end