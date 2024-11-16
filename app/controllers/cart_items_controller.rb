class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  # GET /cart_items or /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1 or /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items or /cart_items.json
  #def create
  #  @cart_item = CartItem.new(cart_item_params)
  #  respond_to do |format|
  #    if @cart_item.save
  #      # Asegúrate de que el modelo `Product` tiene un método que devuelva el nombre o cualquier atributo necesario
  #      format.json { render json: { product_name: @cart_item.product.name, quantity: @cart_item.quantity }, status: :created }
  #      format.html { redirect_to @cart_item, notice: "Cart item was successfully created." }
  #    else
  #      format.json { render json: { error: "Error al añadir el producto. Verifica la cantidad o el stock." }, status: :unprocessable_entity }
  #      format.html { render :new, status: :unprocessable_entity }
  #    end
  #  end
  #end
  def create
    @cart_item = CartItem.new(cart_item_params)

    respond_to do |format|
      if @cart_item.save
        @cart_items = CartItem.where(user_id: current_user.id)
        @cart_total = @cart_items.sum { |item| item.product.price * item.quantity }

        format.js  # Asegúrate de que haya un archivo `create.js.erb`
      else
        format.html { redirect_to product_path(@cart_item.product_id), alert: 'Error al añadir al carrito.' }
        format.js { render json: { error: 'Error al añadir al carrito.' }, status: :unprocessable_entity }
      end
    end
  end





  # PATCH/PUT /cart_items/1 or /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: "Cart item was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1 or /cart_items/1.json
  def destroy
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_items_path, status: :see_other, notice: "Cart item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Calcula el total de los artículos en el carrito
    def calculate_cart_total(cart_items)
      cart_items.inject(0) { |sum, item| sum + item.product.price * item.quantity }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end

end
