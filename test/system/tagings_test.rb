require "application_system_test_case"

class TagingsTest < ApplicationSystemTestCase
  setup do
    @taging = tagings(:one)
  end

  test "visiting the index" do
    visit tagings_url
    assert_selector "h1", text: "Tagings"
  end

  test "creating a Taging" do
    visit tagings_url
    click_on "New Taging"

    fill_in "Tag", with: @taging.tag_id
    fill_in "Tagable", with: @taging.tagable_id
    fill_in "Tagable type", with: @taging.tagable_type
    click_on "Create Taging"

    assert_text "Taging was successfully created"
    click_on "Back"
  end

  test "updating a Taging" do
    visit tagings_url
    click_on "Edit", match: :first

    fill_in "Tag", with: @taging.tag_id
    fill_in "Tagable", with: @taging.tagable_id
    fill_in "Tagable type", with: @taging.tagable_type
    click_on "Update Taging"

    assert_text "Taging was successfully updated"
    click_on "Back"
  end

  test "destroying a Taging" do
    visit tagings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taging was successfully destroyed"
  end
end
