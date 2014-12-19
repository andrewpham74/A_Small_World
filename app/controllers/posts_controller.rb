class PostsController < ApplicationController
	before_filter :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def create 
		@post = Post.new(post_params)

		@post.user = current_user

		respond_to do |format|
			if @post.save
			format.html {redirect_to @post,
			              notice: 'Post was successfully created.'}
			format.json { render action: 'show',
			              status: :created, location: @post}
			else
			format.html { render action: 'new'}
			format.json { render json: @json.errors, 
			              status: :unprocessable_entity}	
			end
	    end
	end

	def show
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def update 
		respond_to do |format|
			if @post.update(post_params)
			format.html {redirect_to @post,
			              notice: 'Post was successfully updated.'}
			format.json { render action: 'show',
			              status: :ok, location: @post}
			else
			format.html { render action: 'edit'}
			format.json { render json: @json.errors, 
			              status: :unprocessable_entity}	
			end
	    end
	end

	def destroy
		@post.destroy

		redirect_to blog_url
	end

	def set_post
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end
end