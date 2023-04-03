require 'test_helper'

class ModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model = models(:one)
  end

  test 'should get index' do
    get models_url, as: :json
    assert_response :success
  end

  test 'should create model' do
    assert_difference('Model.count', 0) do
      post brand_models_path(@model.brand_id),
           params: { model: { average_price: @model.average_price, brand_id: @model.brand_id, name: @model.name } }, as: :json
    end

    assert_response 422 # <422: Unprocessable Entity>
    # Response body: {"name":["has already been taken"]}
  end
end
