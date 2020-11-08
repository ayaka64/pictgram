class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @topic = Topic.find(params[:topic_id])
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    #binding.pry
    
    if @comment.save
      redirect_to comments_path, success: 'コメントしました'
      
    else
      flash.now[:danger] = "コメントできませんでした"
      render :new
    end
  end
    
    private
    def comment_params
      params.require(:comment).permit(:topic_id, :description)
    end
  
end
