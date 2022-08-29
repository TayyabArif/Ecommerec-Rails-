class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /line_items
  def index
    @line_item= current_user.orders.in_progress.first.line_items
    render json: @line_item
  end

  # GET /line_items/1
  def show
    render json: @line_item
  end

  # POST /line_items
  def create
    @product=  current_user.orders.in_progress.first.line_items
      if(@product.find{|a| a.product_id == params[:line_item][:product_id]})
        @line_item = @product.find{|a| a.product_id == params[:line_item][:product_id]}
        @line_item.quantity = params[:line_item][:quantity]
        @line_item.save
        return  render json: @line_item, status: :created, location: @line_item
      end
    # end
    # current_user.line_items
    @line_item = LineItem.new(line_item_params)
    @line_item.order= current_user.orders.in_progress.first
    if @line_item.save
      render json: @line_item, status: :created, location: @line_item
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_items/1
  def update
    
    if @line_item.update(line_item_params)
      # @line_item.quantity = @line_item.quantity + 1
      render json: @line_item
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:quantity, :product_id)
    end
end
