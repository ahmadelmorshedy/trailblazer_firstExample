require 'test_helper'

class CatalogsControllerTest < ActionController::TestCase
  setup do
    @catalog = catalogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalog" do
    assert_difference('Catalog.count') do
      post :create, catalog: { avg_cost: @catalog.avg_cost, name: @catalog.name, total_cost: @catalog.total_cost, total_items: @catalog.total_items }
    end

    assert_redirected_to catalog_path(assigns(:catalog))
  end

  test "should show catalog" do
    get :show, id: @catalog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalog
    assert_response :success
  end

  test "should update catalog" do
    patch :update, id: @catalog, catalog: { avg_cost: @catalog.avg_cost, name: @catalog.name, total_cost: @catalog.total_cost, total_items: @catalog.total_items }
    assert_redirected_to catalog_path(assigns(:catalog))
  end

  test "should destroy catalog" do
    assert_difference('Catalog.count', -1) do
      delete :destroy, id: @catalog
    end

    assert_redirected_to catalogs_path
  end
end
