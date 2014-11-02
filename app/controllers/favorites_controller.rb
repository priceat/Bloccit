class FavoritesController < ApplicationController

def create
  @post = Post.find(params[:post_id])
  favorite = current_user.favorites.build(post: @post)

  authorize favorite
  if favorite.save
    #Why is this a local and not an instance variable like @comment.save?
      flash[:notice] = "You picked a Fav!"
      redirect_to [@post.topic,@post]

  else
    flash[:error] = "Favorite failed to save."
      redirect_to [@post.topic,@post]
    end
end

def destroy
  @post = Post.find(params[:post_id])
  favorite = current_user.favorites.build(post: @post)

  authorize favorite
  if favorite.destroy
      flash[:notice] = "Unfavorited, kid!"
      redirect_to [@post.topic, @post]
  else
      flash[:error] = "Still a favorite. Work harder."
      redirect_to [@post.topic, @post]
  end
end

end
