class TagsController < ApplicationController

    def index
        tags = Tag.all 
        render json: tags
    end

    def show
        tag = Tag.find(params[:id])
        render json: tag
    end

    def create
        tag = Tag.create(tag_params)
        render json: tag
    end

    def update
        tag = Tag.find(params[:id])
        tag.update(tag_params)
        render json: tag
    end

    def destroy
        tag = Tag.find(params[:id])
        tag.destroy
        render json: { message: 'success'}
    end

    private

    def tag_params
        params.require(:tag).permit(:name)
    end

end
