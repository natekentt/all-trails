module Api
  module V1
    class TrailsController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :set_trail, only: %i[ show edit update destroy ]

      # GET /trails or /trails.json
      def index
        @trails = Trail.all

        render json: TrailSerializer.new(@trails, options).serialized_json
      end

      # GET /trails/1 or /trails/1.json (boilerplate)
      # in this case, now its trails/slug-name
      def show
        @trail = Trail.find_by(slug: params[:slug])

        render json: TrailSerializer.new(@trail, options).serialized_json
      end

      # GET /trails/new
      def new
        @trail = Trail.new
      end

      # GET /trails/1/edit
      def edit
      end

      # POST /trails or /trails.json
      # def create
      #   @trail = Trail.new(trail_params)

      #   respond_to do |format|
      #     if @trail.save
      #       format.html { redirect_to @trail, notice: "Trail was successfully created." }
      #       format.json { render :show, status: :created, location: @trail }
      #     else
      #       format.html { render :new, status: :unprocessable_entity }
      #       format.json { render json: @trail.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end
      def create
        @trail = Trail.new(trail_params)

        if @trail.save
          render json: TrailSerializer.new(@trail).serializable_hash, status: :created # Serialize with fast_jsonapi
        else
          render json: @trail.errors, status: :unprocessable_entity #Handle with frontend
        end
      end

      # PATCH/PUT /trails/1 or /trails/1.json
      def update
        if @trail.update(trail_params)
          # format.html { redirect_to @trail, notice: "Trail was successfully updated." }
          # format.json { render :show, status: :ok, location: @trail }
          render json: TrailSerializer.new(@trail, options).serializable_hash, status: :created # Serialize with fast_jsonapi
        else
          # format.html { render :edit, status: :unprocessable_entity }
          # format.json { render json: @trail.errors, status: :unprocessable_entity }
          render json: @trail.errors, status: :unprocessable_entity #Handle with frontend
        end
      end

      # DELETE /trails/1 or /trails/1.json
      def destroy
        if @trail.destroy!
          head :no_content
        else
          render json: @trail.errors, status: :unprocessable_entity #Handle with frontend

        # respond_to do |format|
        #   format.html { redirect_to trails_path, status: :see_other, notice: "Trail was successfully destroyed." }
        #   format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_trail
          #@trail = Trail.find(params.expect(:id)) (boilerplate, should i use this?)
          @trail = Trail.find_by(slug: params[:slug])
        end

        # Only allow a list of trusted parameters through.
        def trail_params
          params.expect(trail: [ :name, :description, :difficulty, :length, :elevation_gain, :route_type, :latitude, :longitude, :address, :city, :state, :country, :zip_code, :average_rating, :image_url, :park_id ])
        end

        # compound response, returns "included" section with other model types that belong to it
        # i.e, reviews
        def options
          @options ||= { include: %i[reviews] }
        end
    end
  end
end
