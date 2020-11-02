class UserPostsController < ApplicationController
    
    def index
        user_posts = UserPost.all 
        render json: user_posts
    end

    def show
        user_post = UserPost.find(params[:id])
        render json: user_post
    end

    def create
        user_post = UserPost.create(user_post_params)
        render json: user_post
    end

    def update
        user_post = UserPost.find(params[:id])
        user_post.update(user_post_params)
        render json: user_post
    end

    def destroy
        user_post = UserPost.find(params[:id])
        user_post.destroy
        render json: { message: 'success'}
    end

    private

    def user_post_params
        params.require(:user_post).permit(:id, :user_id, :post_id)
    end

end
