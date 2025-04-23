class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: %i[ show edit update destroy ]
  before_action :set_services, only: %i[ create edit ]

  # GET /service_requests or /service_requests.json
  def my_requests
    authorize! :my_requests, ServiceRequest
    @service_requests = ServiceRequest.where(client: current_user)
  end

  def closed_requests
    authorize! :my_requests, ServiceRequest
    @service_requests = ServiceRequest.closed.where(client: current_user)
  end

  def open_requests
    authorize! :my_requests, ServiceRequest
    @service_requests = ServiceRequest.open.where(client: current_user)
  end

  def cancelled_requests
    authorize! :my_requests, ServiceRequest
    @service_requests = ServiceRequest.cancelled.where(client: current_user)
  end

  def in_progress_requests
    authorize! :my_requests, ServiceRequest
    @service_requests = ServiceRequest.in_progress.where(client: current_user)
  end

  def available_requests
    authorize! :my_requests, ServiceRequest
  end

  # GET /service_requests/1 or /service_requests/1.json
  def show
    authorize! :read, ServiceRequest
  end

  # GET /service_requests/new
  def new
    authorize! :create, ServiceRequest

    @service_request = ServiceRequest.new
    @services = Service.all
  end

  # GET /service_requests/1/edit
  def edit
    authorize! :update, @service_request
  end

  # POST /service_requests or /service_requests.json
  def create
    authorize! :create, ServiceRequest

    @service_request = ServiceRequest.new(service_request_params)
    @service_request.client = current_user

    respond_to do |format|
      if @service_request.save
        format.html { redirect_to @service_request, notice: "Service request was successfully created." }
        format.json { render :show, status: :created, location: @service_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_requests/1 or /service_requests/1.json
  def update
    authorize! :update, @service_request

    respond_to do |format|
      if @service_request.update(service_request_params)
        format.html { redirect_to @service_request, notice: "Service request was successfully updated." }
        format.json { render :show, status: :ok, location: @service_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_requests/1 or /service_requests/1.json
  def destroy
    authorize! :destroy, @service_request

    @service_request.destroy!

    respond_to do |format|
      format.html { redirect_to service_requests_path, status: :see_other, notice: "Service request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_request_params
      params.require(:service_request).permit(:title, :description, :service_id, :client_id)
    end

    def set_services
      @services = Service.all
    end
end
