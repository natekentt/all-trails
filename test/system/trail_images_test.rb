require "application_system_test_case"

class TrailImagesTest < ApplicationSystemTestCase
  setup do
    @trail_image = trail_images(:one)
  end

  test "visiting the index" do
    visit trail_images_url
    assert_selector "h1", text: "Trail images"
  end

  test "should create trail image" do
    visit trail_images_url
    click_on "New trail image"

    fill_in "Image url", with: @trail_image.image_url
    fill_in "Trail", with: @trail_image.trail_id
    click_on "Create Trail image"

    assert_text "Trail image was successfully created"
    click_on "Back"
  end

  test "should update Trail image" do
    visit trail_image_url(@trail_image)
    click_on "Edit this trail image", match: :first

    fill_in "Image url", with: @trail_image.image_url
    fill_in "Trail", with: @trail_image.trail_id
    click_on "Update Trail image"

    assert_text "Trail image was successfully updated"
    click_on "Back"
  end

  test "should destroy Trail image" do
    visit trail_image_url(@trail_image)
    click_on "Destroy this trail image", match: :first

    assert_text "Trail image was successfully destroyed"
  end
end
