class ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to @product
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update_attributes(product_params)
			redirect_to @product
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])

		@product.destroy

		redirect_to video_purchasing_url
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price_in_cents, :download_url, :image)
	end
end
