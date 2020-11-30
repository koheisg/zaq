require 'test_helper'

class TagingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taging = tagings(:one)
  end

  test "should get index" do
    get tagings_url
    assert_response :success
  end

  test "should get new" do
    get new_taging_url
    assert_response :success
  end

  test "should create taging" do
    assert_difference('Taging.count') do
      post tagings_url, params: { taging: { tag_id: @taging.tag_id, tagable_id: @taging.tagable_id, tagable_type: @taging.tagable_type } }
    end

    assert_redirected_to taging_url(Taging.last)
  end

  test "should show taging" do
    get taging_url(@taging)
    assert_response :success
  end

  test "should get edit" do
    get edit_taging_url(@taging)
    assert_response :success
  end

  test "should update taging" do
    patch taging_url(@taging), params: { taging: { tag_id: @taging.tag_id, tagable_id: @taging.tagable_id, tagable_type: @taging.tagable_type } }
    assert_redirected_to taging_url(@taging)
  end

  test "should destroy taging" do
    assert_difference('Taging.count', -1) do
      delete taging_url(@taging)
    end

    assert_redirected_to tagings_url
  end
end
