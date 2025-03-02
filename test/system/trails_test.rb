require "application_system_test_case"

class TrailsTest < ApplicationSystemTestCase
  setup do
    @trail = trails(:one)
  end

  test "visiting the index" do
    visit trails_url
    assert_selector "h1", text: "Trails"
  end

  test "should create trail" do
    visit trails_url
    click_on "New trail"

    fill_in "Address", with: @trail.address
    fill_in "Average rating", with: @trail.average_rating
    fill_in "City", with: @trail.city
    fill_in "Country", with: @trail.country
    fill_in "Description", with: @trail.description
    fill_in "Difficulty", with: @trail.difficulty
    fill_in "Elevation gain", with: @trail.elevation_gain
    fill_in "Image url", with: @trail.image_url
    fill_in "Latitude", with: @trail.latitude
    fill_in "Length", with: @trail.length
    fill_in "Longitude", with: @trail.longitude
    fill_in "Name", with: @trail.name
    fill_in "Park", with: @trail.park_id
    fill_in "Route type", with: @trail.route_type
    fill_in "State", with: @trail.state
    fill_in "Zip code", with: @trail.zip_code
    click_on "Create Trail"

    assert_text "Trail was successfully created"
    click_on "Back"
  end

  test "should update Trail" do
    visit trail_url(@trail)
    click_on "Edit this trail", match: :first

    fill_in "Address", with: @trail.address
    fill_in "Average rating", with: @trail.average_rating
    fill_in "City", with: @trail.city
    fill_in "Country", with: @trail.country
    fill_in "Description", with: @trail.description
    fill_in "Difficulty", with: @trail.difficulty
    fill_in "Elevation gain", with: @trail.elevation_gain
    fill_in "Image url", with: @trail.image_url
    fill_in "Latitude", with: @trail.latitude
    fill_in "Length", with: @trail.length
    fill_in "Longitude", with: @trail.longitude
    fill_in "Name", with: @trail.name
    fill_in "Park", with: @trail.park_id
    fill_in "Route type", with: @trail.route_type
    fill_in "State", with: @trail.state
    fill_in "Zip code", with: @trail.zip_code
    click_on "Update Trail"

    assert_text "Trail was successfully updated"
    click_on "Back"
  end

  test "should destroy Trail" do
    visit trail_url(@trail)
    click_on "Destroy this trail", match: :first

    assert_text "Trail was successfully destroyed"
  end
end
