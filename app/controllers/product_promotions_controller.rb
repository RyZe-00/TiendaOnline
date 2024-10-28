class ProductPromotionsController < ApplicationController
  before_action :set_product_promotion, only: %i[ show edit update destroy ]

  # GET /product_promotions or /product_promotions.json
  def index
    @product_promotions = ProductPromotion.all
  end

  # GET /product_promotions/1 or /product_promotions/1.json
  def show
  end

  # GET /product_promotions/new
  def new
    @product_promotion = ProductPromotion.new
  end

  # GET /product_promotions/1/edit
  def edit
  end

  # POST /product_promotions or /product_promotions.json
  def create
    @product_promotion = ProductPromotion.new(product_promotion_params)

    respond_to do |format|
      if @product_promotion.save
        format.html { redirect_to @product_promotion, notice: "Product promotion was successfully created." }
        format.json { render :show, status: :created, location: @product_promotion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_promotions/1 or /product_promotions/1.json
  def update
    respond_to do |format|
      if @product_promotion.update(product_promotion_params)
        format.html { redirect_to @product_promotion, notice: "Product promotion was successfully updated." }
        format.json { render :show, status: :ok, location: @product_promotion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_promotions/1 or /product_promotions/1.json
  def destroy
    @product_promotion.destroy

    respond_to do |format|
      format.html { redirect_to product_promotions_path, status: :see_other, notice: "Product promotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_promotion
      @product_promotion = ProductPromotion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_promotion_params
      params.require(:product_promotion).permit(:product_id, :promotion_id)
    end
end
