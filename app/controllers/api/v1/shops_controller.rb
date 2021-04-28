class Api::V1::ShopsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_shop, only: %i[ show edit update destroy ]

  # GET /shops or /shops.json
  def index
   @shops = Shop.all
   render json: @shops
  end

  # GET /shops/1 or /shops/1.json
  def show
  render json: @shop

  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops or /shops.json
  def create
    @shop = Shop.new(shop_params)

    if @shop.save
    render json: @shop, status: :created, location: api_v1_shop_url(@shop)
   else
    render json: @shop.errors, status: :unprocessable_entity
   end

  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    if @shop.update(shop_params)
    render json: @shop
   else
    render json: @shop.errors, status: :unprocessable_entity
   end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    @shop.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:title, :content, :slug)
    end
end
