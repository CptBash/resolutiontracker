require 'test_helper'

class ResolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resolution = resolutions(:one)
  end

  test "should get index" do
    get resolutions_url
    assert_response :success
  end

  test "should get new" do
    get new_resolution_url
    assert_response :success
  end

  test "should create resolution" do
    assert_difference('Resolution.count') do
      post resolutions_url, params: { resolution: { fri: @resolution.fri, goal_ids: @resolution.goal_ids, mission_statement: @resolution.mission_statement, mon: @resolution.mon, name: @resolution.name, sat: @resolution.sat, spam_time: @resolution.spam_time, state_id: @resolution.state, sun: @resolution.sun, thu: @resolution.thu, tue: @resolution.tue, user_id: @resolution.user_id, wed: @resolution.wed } }
    end

    assert_redirected_to resolution_url(Resolution.last)
  end

  test "should show resolution" do
    get resolution_url(@resolution)
    assert_response :success
  end

  test "should get edit" do
    get edit_resolution_url(@resolution)
    assert_response :success
  end

  test "should update resolution" do
    patch resolution_url(@resolution), params: { resolution: { fri: @resolution.fri, goal_ids: @resolution.goal_ids, mission_statement: @resolution.mission_statement, mon: @resolution.mon, name: @resolution.name, sat: @resolution.sat, spam_time: @resolution.spam_time, state_id: @resolution.state_id, sun: @resolution.sun, thu: @resolution.thu, tue: @resolution.tue, user_id: @resolution.user_id, wed: @resolution.wed } }
    assert_redirected_to resolution_url(@resolution)
  end

  test "should destroy resolution" do
    assert_difference('Resolution.count', -1) do
      delete resolution_url(@resolution)
    end

    assert_redirected_to resolutions_url
  end
end
