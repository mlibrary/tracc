require 'test_helper'

class StrategicSortingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strategic_sorting = strategic_sortings(:one)
  end

  test "should get index" do
    get strategic_sortings_url
    assert_response :success
  end

  test "should get new" do
    get new_strategic_sorting_url
    assert_response :success
  end

  test "should create strategic_sorting" do
    assert_difference('StrategicSorting.count') do
      post strategic_sortings_url, params: { strategic_sorting: {  } }
    end

    assert_redirected_to strategic_sorting_url(StrategicSorting.last)
  end

  test "should show strategic_sorting" do
    get strategic_sorting_url(@strategic_sorting)
    assert_response :success
  end

  test "should get edit" do
    get edit_strategic_sorting_url(@strategic_sorting)
    assert_response :success
  end

  test "should update strategic_sorting" do
    patch strategic_sorting_url(@strategic_sorting), params: { strategic_sorting: {  } }
    assert_redirected_to strategic_sorting_url(@strategic_sorting)
  end

  test "should destroy strategic_sorting" do
    assert_difference('StrategicSorting.count', -1) do
      delete strategic_sorting_url(@strategic_sorting)
    end

    assert_redirected_to strategic_sortings_url
  end
end
