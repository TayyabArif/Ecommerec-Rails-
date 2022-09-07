class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
   before_action :authenticate_user!, except: [:show,:all_products ]

  # GET /products
  def index
    byebug
    @product = current_user.products
    render json: @product
  end

  def all_products
    @category= Category.find(params[:id])
      @product= @category.products.paginate(:page => params[:page])
      page= @product.current_page
    pages= @product.total_pages
    render json: @product, page: page, pages: pages, status: :ok
  end

  # GET /products/1
  def show
    @product= Product.find(params[:id])
    render json: @product
  end

  # POST /products
  def create
    byebug
    @product = Product.new(product_params)
    @product.user= current_user
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if current_user.id== @product.user.id
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    else
      render json: {message: "You are not authorized"}, status: :unprocessable_entity
    end


  end

  # DELETE /products/1
  def destroy
    if current_user.id== @product.user.id
        @product.destroy
    else
      render json: {message: "You are not authorized"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.permit(:title, :description, :price, :category_id, :images => [])
      # puts"*********************************#{my_params[:price]}*************************"
      # return my_params
    end
end
