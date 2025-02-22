class ProductsController < ApplicationController
  before_action :set_guest_user
  before_action :set_product, only: %i[ show edit update destroy ]


  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  #def show
  #end
  def show
    @product = Product.find(params[:id])
    # Asegúrate de que se carga el carrito del usuario actual
    @cart_items = CartItem.where(user_id: current_user.id) if user_signed_in?
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #def product_params
    #  params.require(:product).permit(:name, :description, :price, :stock)
    #end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, category_ids: [])
    end

    def set_guest_user
      # Si el usuario no está firmado, se asigna el rol 'guest'
      @current_user_role = user_signed_in? ? current_user.role : 'guest'
    end

end
