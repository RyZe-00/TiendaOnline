require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = users(:admin)
    sign_in @admin_user
  end

  test "debe crear un producto" do
    assert_difference('Product.count', 1) do
      post products_url, params: {
        product: {
          name: "Nuevo Producto",
          description: "Descripción del producto",
          price: 99.99,
          stock: 10,
          category_id: categories(:example_category).id
        }
      }
    end
    assert_redirected_to product_path(Product.last)
  end

  test "no debe crear producto sin nombre" do
    assert_no_difference('Product.count') do
      post products_url, params: {
        product: {
          name: "", # Nombre vacío
          description: "Descripción",
          price: 50.0,
          stock: 5,
          category_id: categories(:example_category).id
        }
      }
    end
    assert_response :unprocessable_entity
  end
end

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: @product.description, name: @product.name, price: @product.price, stock: @product.stock } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, name: @product.name, price: @product.price, stock: @product.stock } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
