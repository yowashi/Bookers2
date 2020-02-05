class PostImagesController < ApplicationController
	before_action :authenticate_user!

	def new
		@post_image = PostImage.new
	end

	def create
		@post_image = PostImage.new(post_image_params)
		post_image.user_id = current_user.id
		if @post_image.save
			redirect_to post_images_path
		else
			render :index
	end

	def destroy
		@post_image = PostImage.find(params[:id])
		@post_image.destroy
		redirect_to post_images_path
	end

	def show
	end

	private
	def post_image_params
		params.require(:post_image).permit(:name, :image)
	end
end