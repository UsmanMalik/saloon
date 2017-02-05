module Manager
  class SubSubCategoriesController < ApplicationController
    before_action :set_sub_sub_category, only: [:show, :edit, :update, :destroy]

    # GET /sub_sub_categories
    # GET /sub_sub_categories.json
    def index
      @sub_sub_categories = SubSubCategory.all
    end

    # GET /sub_sub_categories/1
    # GET /sub_sub_categories/1.json
    def show
    end

    # GET /sub_sub_categories/new
    def new
      @sub_sub_category = SubSubCategory.new
    end

    # GET /sub_sub_categories/1/edit
    def edit
    end

    # POST /sub_sub_categories
    # POST /sub_sub_categories.json
    def create
      @sub_sub_category = SubSubCategory.new(sub_sub_category_params)

      respond_to do |format|
        if @sub_sub_category.save
          format.html { redirect_to @sub_sub_category, notice: 'Sub sub category was successfully created.' }
          format.json { render :show, status: :created, location: @sub_sub_category }
        else
          format.html { render :new }
          format.json { render json: @sub_sub_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /sub_sub_categories/1
    # PATCH/PUT /sub_sub_categories/1.json
    def update
      respond_to do |format|
        if @sub_sub_category.update(sub_sub_category_params)
          format.html { redirect_to @sub_sub_category, notice: 'Sub sub category was successfully updated.' }
          format.json { render :show, status: :ok, location: @sub_sub_category }
        else
          format.html { render :edit }
          format.json { render json: @sub_sub_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /sub_sub_categories/1
    # DELETE /sub_sub_categories/1.json
    def destroy
      @sub_sub_category.destroy
      respond_to do |format|
        format.html { redirect_to sub_sub_categories_url, notice: 'Sub sub category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_sub_sub_category
        @sub_sub_category = SubSubCategory.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def sub_sub_category_params
        params.require(:sub_sub_category).permit(:title, :description, :sub_category_id)
      end
  end
end