require "application_system_test_case"

class StrategicSortingsTest < ApplicationSystemTestCase
  setup do
    @strategic_sorting = strategic_sortings(:one)
  end

  test "visiting the index" do
    visit strategic_sortings_url
    assert_selector "h1", text: "Strategic Sortings"
  end

  test "creating a Strategic sorting" do
    visit strategic_sortings_url
    click_on "New Strategic Sorting"

    click_on "Create Strategic sorting"

    assert_text "Strategic sorting was successfully created"
    click_on "Back"
  end

  test "updating a Strategic sorting" do
    visit strategic_sortings_url
    click_on "Edit", match: :first

    click_on "Update Strategic sorting"

    assert_text "Strategic sorting was successfully updated"
    click_on "Back"
  end

  test "destroying a Strategic sorting" do
    visit strategic_sortings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Strategic sorting was successfully destroyed"
  end
end
