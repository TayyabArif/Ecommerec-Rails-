class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  def stripe_checkout
    order=Order.find(params[:order][:order_id]).line_items
    byebug
    line_items= order.collect {|item| {
      price_data: {
      currency: 'inr',
      unit_amount:  item.line_total.to_int*100,
      product_data: {
      name: Product.find(item.product_id).title,
      description: 'Comfortable cotton t-shirt',
      }
    },
    quantity: 1
    }
    }
    byebug
    session = Stripe::Checkout::Session.create({
  payment_method_types: ['card'],
  line_items: line_items,
  mode: 'payment',
  success_url: 'https://example.com/success?session_id={CHECKOUT_SESSION_ID}',
  cancel_url: 'https://example.com/cancel',
  }, {stripe_account: 'acct_1Lbq3VSJOYZVmWap'}
)
    render json: session
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
  
    if (current_user.orders.in_progress.first)
      @order= current_user.orders.in_progress.first
    else
      @order = Order.new(order_params)
      @order.user= current_user
      @order.email= current_user.email
      @order.name= current_user.name + " " + current_user.surname
    end
      if @order.save
        render json: @order, status: :created, location: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  def stripe_webhook

    case params[:type]
    when "checkout.session.completed"
    when "charge.succeeded"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:address)
    end
end
