require "test_helper"

class ProductPromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_promotion = product_promotions(:one)
  end

  test "should get index" do
    get product_promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_product_promotion_url
    assert_response :success
  end

  test "should create product_promotion" do
    assert_difference("ProductPromotion.count") do
      post product_promotions_url, params: { product_promotion: { product_id: @product_promotion.product_id, promotion_id: @product_promotion.promotion_id } }
    end

    assert_redirected_to product_promotion_url(ProductPromotion.last)
  end

  test "should show product_promotion" do
    get product_promotion_url(@product_promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_promotion_url(@product_promotion)
    assert_response :success
  end

  test "should update product_promotion" do
    patch product_promotion_url(@product_promotion), params: { product_promotion: { product_id: @product_promotion.product_id, promotion_id: @product_promotion.promotion_id } }
    assert_redirected_to product_promotion_url(@product_promotion)
  end

  test "should destroy product_promotion" do
    assert_difference("ProductPromotion.count", -1) do
      delete product_promotion_url(@product_promotion)
    end

    assert_redirected_to product_promotions_url
  end
end
