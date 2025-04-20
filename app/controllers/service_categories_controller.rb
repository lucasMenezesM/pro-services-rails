class ServiceCategoriesController < ApplicationController
  before_action :set_service_category, only: %i[ show edit update destroy ]

  # GET /service_categories or /service_categories.json
  def index
    @service_categories = ServiceCategory.all
  end

  # GET /service_categories/1 or /service_categories/1.json
  def show
  end

  # GET /service_categories/new
  def new
    @service_category = ServiceCategory.new
  end

  # GET /service_categories/1/edit
  def edit
  end

  # POST /service_categories or /service_categories.json
  def create
    @service_category = ServiceCategory.new(service_category_params)

    respond_to do |format|
      if @service_category.save
        format.html { redirect_to @service_category, notice: "Service category was successfully created." }
        format.json { render :show, status: :created, location: @service_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_categories/1 or /service_categories/1.json
  def update
    respond_to do |format|
      if @service_category.update(service_category_params)
        format.html { redirect_to @service_category, notice: "Service category was successfully updated." }
        format.json { render :show, status: :ok, location: @service_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_categories/1 or /service_categories/1.json
  def destroy
    @service_category.destroy!

    respond_to do |format|
      format.html { redirect_to service_categories_path, status: :see_other, notice: "Service category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_category
      @service_category = ServiceCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_category_params
      params.require(:service_category).permit(:name)
    end
end
