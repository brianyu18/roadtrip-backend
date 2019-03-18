require 'test_helper'

class TripUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_user = trip_users(:one)
  end

  test "should get index" do
    get trip_users_url, as: :json
    assert_response :success
  end

  test "should create trip_user" do
    assert_difference('TripUser.count') do
      post trip_users_url, params: { trip_user: { trip_id_id: @trip_user.trip_id_id, user_id_id: @trip_user.user_id_id } }, as: :json
    end

    assert_response 201
  end

  test "should show trip_user" do
    get trip_user_url(@trip_user), as: :json
    assert_response :success
  end

  test "should update trip_user" do
    patch trip_user_url(@trip_user), params: { trip_user: { trip_id_id: @trip_user.trip_id_id, user_id_id: @trip_user.user_id_id } }, as: :json
    assert_response 200
  end

  test "should destroy trip_user" do
    assert_difference('TripUser.count', -1) do
      delete trip_user_url(@trip_user), as: :json
    end

    assert_response 204
  end
end
