class CommentsController < ApplicationController
    before_action  :set_post
    def create
       @comment = @post.comments.create(comment_params)
       redirect_to @post
    end

    def edit 
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        
        respond_to do |format|
          if @comment.update(comment_params)
            format.html { redirect_to post_url(@post), notice: "Comment was successfully updated." }
            format.json { render :show, status: :ok, location: @post }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        respond_to do |format|
          format.html { redirect_to post_url(@post), notice: "Comment was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:name, :content)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
end
