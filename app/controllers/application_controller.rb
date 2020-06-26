class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required
    before_action :set_search
    
    private

    def set_search
        @search = Recipe.ransack(params[:q])
        @search_recipes = @search.result.where(group_id: nil).page(params[:page]).per(20).recent
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to root_url, alert: "このコンテンツを使用するにはログインが必要です" unless current_user
    end
end
