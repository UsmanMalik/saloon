require 'test_helper'

class SubSubCategoriesControllerTest < ActionController::TestCase
  setup do
    @sub_sub_category = sub_sub_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_sub_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_sub_category" do
    assert_difference('SubSubCategory.count') do
      post :create, sub_sub_category: { description: @sub_sub_category.description, sub_category_id: @sub_sub_category.sub_category_id, title: @sub_sub_category.title }
    end

    assert_redirected_to sub_sub_category_path(assigns(:sub_sub_category))
  end

  test "should show sub_sub_category" do
    get :show, id: @sub_sub_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_sub_category
    assert_response :success
  end

  test "should update sub_sub_category" do
    patch :update, id: @sub_sub_category, sub_sub_category: { description: @sub_sub_category.description, sub_category_id: @sub_sub_category.sub_category_id, title: @sub_sub_category.title }
    assert_redirected_to sub_sub_category_path(assigns(:sub_sub_category))
  end

  test "should destroy sub_sub_category" do
    assert_difference('SubSubCategory.count', -1) do
      delete :destroy, id: @sub_sub_category
    end

    assert_redirected_to sub_sub_categories_path
  end
end
