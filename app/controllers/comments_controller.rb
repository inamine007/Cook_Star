class CommentsController < ApplicationController
    def create
        recipe = Recipe.find(params[:recipe_id])
        @comment = recipe.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:notice] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:alert] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:notice] = "コメントを削除しました"
        redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
