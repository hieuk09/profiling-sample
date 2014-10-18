class PageRequestsController < ApplicationController
  before_action :set_page_request, only: [:show, :edit, :update, :destroy]

  # GET /page_requests
  # GET /page_requests.json
  def index
    @page_requests = PageRequest.all
  end

  # GET /page_requests/1
  # GET /page_requests/1.json
  def show
  end

  # GET /page_requests/new
  def new
    @page_request = PageRequest.new
  end

  # GET /page_requests/1/edit
  def edit
  end

  # POST /page_requests
  # POST /page_requests.json
  def create
    @page_request = PageRequest.new(page_request_params)

    respond_to do |format|
      if @page_request.save
        format.html { redirect_to @page_request, notice: 'Page request was successfully created.' }
        format.json { render :show, status: :created, location: @page_request }
      else
        format.html { render :new }
        format.json { render json: @page_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_requests/1
  # PATCH/PUT /page_requests/1.json
  def update
    respond_to do |format|
      if @page_request.update(page_request_params)
        format.html { redirect_to @page_request, notice: 'Page request was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_request }
      else
        format.html { render :edit }
        format.json { render json: @page_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_requests/1
  # DELETE /page_requests/1.json
  def destroy
    @page_request.destroy
    respond_to do |format|
      format.html { redirect_to page_requests_url, notice: 'Page request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_request
      @page_request = PageRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_request_params
      params.require(:page_request).permit(:path, :view_duration, :db_duration, :page_duration)
    end
end
