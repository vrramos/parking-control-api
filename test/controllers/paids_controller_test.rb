require 'test_helper'

class PaidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paid = paids(:one)
  end

  test "should get index" do
    get paids_url, as: :json
    assert_response :success
  end

  test "should create paid" do
    assert_difference('Paid.count') do
      post paids_url, params: { paid: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show paid" do
    get paid_url(@paid), as: :json
    assert_response :success
  end

  test "should update paid" do
    patch paid_url(@paid), params: { paid: {  } }, as: :json
    assert_response 200
  end

  test "should destroy paid" do
    assert_difference('Paid.count', -1) do
      delete paid_url(@paid), as: :json
    end

    assert_response 204
  end
end
