require 'test_helper'

class AthletesControllerTest < ActionController::TestCase

  def setup
    @athlete1 = athletes(:one)
    @athlete2 = athletes(:two)
  end

  test "GET index" do
    get :index, format: :json
    response_item = JSON.parse(response.body)[0]
    ['id', 'nome', 'nascita', 'sport', 'squadra', 'altezza', 'peso', 'retired' ].each do |attr|
      assert_equal @athlete.send(attr), response_item[attr]
    end
    assert_response :success
  end

  test "POST create an athlete" do
    assert_difference('Athlete.count', 1) do
    post :create, format: :json, athlete: { sport: 'test sport', nome: 'test nome', peso: '180', altezza: 'test altezza', squadra: 'test record' }
    end
    assert_response :success
  end

  test "GET show an athlete" do
    get :show, id: @athlete, format: :json
    response_item = JSON.parse(response.body)
    ['id', 'sport', 'nome', 'altezza', 'squadra'].each do |attr|
      assert_equal @athlete1.send(attr), response_item[attr]
    end
    assert_response :success
  end

  test "PATCH update an athlete" do
    patch :update, format: :json, id: @athlete1, athlete: { sport: 'test sport1', nome: 'test nome1', peso: '180b', altezza: 'test altezza1', squadra: 'test record1' }
    assert_response :success
  end

  test 'DELETE destroy does in fact destroy' do
    assert_difference('athlete.count', -1) do
      delete :no_content, id: @athlete1.id, format: :json
    end
  end
  # test 'GET ' do
  # end
  # test 'POST ' do
  # end
  # test 'POST ' do
  # end
  # test 'PUT ' do
  # end
  # test 'PUT ' do
  # end
  # test 'DELETE ' do
  # end
  # # test ' ' do
  # # end
  # # test ' ' do
  # # end
  # # test ' ' do
  # # end
  # # test ' ' do
  # # end

end
