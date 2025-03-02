class TrailImagesController < ApplicationController
  before_action :set_trail_image, only: %i[ show edit update destroy ]

  # GET /trail_images or /trail_images.json
  def index
    @trail_images = TrailImage.all
  end

  # GET /trail_images/1 or /trail_images/1.json
  def show
  end

  # GET /trail_images/new
  def new
    @trail_image = TrailImage.new
  end

  # GET /trail_images/1/edit
  def edit
  end

  # POST /trail_images or /trail_images.json
  def create
    @trail_image = TrailImage.new(trail_image_params)

    respond_to do |format|
      if @trail_image.save
        format.html { redirect_to @trail_image, notice: "Trail image was successfully created." }
        format.json { render :show, status: :created, location: @trail_image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trail_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trail_images/1 or /trail_images/1.json
  def update
    respond_to do |format|
      if @trail_image.update(trail_image_params)
        format.html { redirect_to @trail_image, notice: "Trail image was successfully updated." }
        format.json { render :show, status: :ok, location: @trail_image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trail_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trail_images/1 or /trail_images/1.json
  def destroy
    @trail_image.destroy!

    respond_to do |format|
      format.html { redirect_to trail_images_path, status: :see_other, notice: "Trail image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trail_image
      @trail_image = TrailImage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def trail_image_params
      params.expect(trail_image: [ :trail_id, :image_url ])
    end
end
