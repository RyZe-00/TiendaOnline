require "application_system_test_case"

class ProductPromotionsTest < ApplicationSystemTestCase
  setup do
    @product_promotion = product_promotions(:one)
  end

  test "visiting the index" do
    visit product_promotions_url
    assert_selector "h1", text: "Product promotions"
  end

  test "should create product promotion" do
    visit product_promotions_url
    click_on "New product promotion"

    fill_in "Product", with: @product_promotion.product_id
    fill_in "Promotion", with: @product_promotion.promotion_id
    click_on "Create Product promotion"

    assert_text "Product promotion was successfully created"
    click_on "Back"
  end

  test "should update Product promotion" do
    visit product_promotion_url(@product_promotion)
    click_on "Edit this product promotion", match: :first

    fill_in "Product", with: @product_promotion.product_id
    fill_in "Promotion", with: @product_promotion.promotion_id
    click_on "Update Product promotion"

    assert_text "Product promotion was successfully updated"
    click_on "Back"
  end

  test "should destroy Product promotion" do
    visit product_promotion_url(@product_promotion)
    click_on "Destroy this product promotion", match: :first

    assert_text "Product promotion was successfully destroyed"
  end
end
