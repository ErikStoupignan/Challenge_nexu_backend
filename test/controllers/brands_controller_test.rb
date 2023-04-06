require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brand = brands(:one)
  end

  test 'should get index' do
    get brands_url, as: :json
    assert_response :success
  end

  test 'should create brand' do
    assert_difference('Brand.count') do
      post brands_url, params: { brand: { name: 'Testing' } }, as: :json
    end

    assert_response :created
  end

  test 'should not create brand' do
    post brands_url, params: { brand: { name: 'Testing' } }, as: :json

    assert_difference('Brand.count', 0) do
      post brands_url, params: { brand: { name: 'Testing' } }, as: :json
    end

    assert_response 422 # <422: Unprocessable Entity>
  end

  test 'should show brand' do
    get brand_url(@brand), as: :json
    assert_response :success
  end

  test 'Post a new model inside a brand' do
    post brand_models_url(@brand), params: { model: { name: 'Modelo de pruena', average_price: '100001' } }, as: :json
    assert_response :success
  end

  test 'Average_price can not be smaller than 100,000' do
    post brand_models_url(@brand), params: { model: { name: 'Modelo de pruena', average_price: '100' } }, as: :json
    assert_response 422
  end

  test 'Name can not be empty' do
    post brand_models_url(@brand), params: { model: { name: '', average_price: '100' } }, as: :json
    assert_response 422
  end
end
