require "test_helper"

class TrailImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trail_image = trail_images(:one)
  end

  test "should get index" do
    get trail_images_url
    assert_response :success
  end

  test "should get new" do
    get new_trail_image_url
    assert_response :success
  end

  test "should create trail_image" do
    assert_difference("TrailImage.count") do
      post trail_images_url, params: { trail_image: { image_url: @trail_image.image_url, trail_id: @trail_image.trail_id } }
    end

    assert_redirected_to trail_image_url(TrailImage.last)
  end

  test "should show trail_image" do
    get trail_image_url(@trail_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_trail_image_url(@trail_image)
    assert_response :success
  end

  test "should update trail_image" do
    patch trail_image_url(@trail_image), params: { trail_image: { image_url: @trail_image.image_url, trail_id: @trail_image.trail_id } }
    assert_redirected_to trail_image_url(@trail_image)
  end

  test "should destroy trail_image" do
    assert_difference("TrailImage.count", -1) do
      delete trail_image_url(@trail_image)
    end

    assert_redirected_to trail_images_url
  end
end
