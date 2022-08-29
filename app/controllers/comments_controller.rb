class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show, :my_comments]
  # GET /comments
  def index
  end

  def my_comments
    @product= Product.find(params[:id])
    @comment = @product.comments.paginate(:page => params[:page])
    page= @comment.current_page
    pages= @comment.total_pages
    render json: @comment, page: page, pages: pages, status: :ok
  end
  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
      @comment = Comment.new(comment_params)
      @comment.user= current_user
      if @comment.save
        render json: @comment, status: :created, location: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /comments/1
  def update
    if current_user.id == @comment.user.id
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end

    else
      render json: {message: "You are not authorized"}, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    if current_user.id == @comment.user.id
       @comment.destroy
    else
      render json: {message: "You are not authorized"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :product_id)
    end
end
