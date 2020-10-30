class PostsController < ApplicationController

    def index
        posts = Post.all 
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def create
        post = Post.create(post_params)
        render json: post
    end

    def update
        post = Post.find(params[:id])
        post.update(post_params)
        render json: post
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { message: 'success'}
    end

    private

    def post_params
        params.require(:post).permit(:title, :description, :user_id, :link_url, :post_id, :likes, :category)
    end

end
