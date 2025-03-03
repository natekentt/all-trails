module Api
  module V1
    class ReviewsController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :set_review, only: %i[ destroy ]

      # GET /reviews or /reviews.json
      # def index
      #   @reviews = Review.all
      # end

      # GET /reviews/1 or /reviews/1.json
      # def show
      #   render json: ReviewSerializer.new(review).serialized_json
      # end

      # GET /reviews/new
      # def new
      #   @review = Review.new
      # end

      # GET /reviews/1/edit
      # def edit
      # end

      # POST /reviews or /reviews.json
      def create
        @review = Review.new(review_params)

        if @review.save
          render json: ReviewSerializer.new(@review).serializable_hash, status: :created # Serialize with fast_jsonapi
        else
          render json: @review.errors, status: :unprocessable_entity #Handle with frontend
        end
        # respond_to do |format|
        #   if @review.save
        #     format.html { redirect_to @review, notice: "Review was successfully created." }
        #     format.json { render :show, status: :created, location: @review }
        #   else
        #     format.html { render :new, status: :unprocessable_entity }
        #     format.json { render json: @review.errors, status: :unprocessable_entity }
        #   end
        # end
      end

      # PATCH/PUT /reviews/1 or /reviews/1.json
      # def update
      #   respond_to do |format|
      #     if @review.update(review_params)
      #       format.html { redirect_to @review, notice: "Review was successfully updated." }
      #       format.json { render :show, status: :ok, location: @review }
      #     else
      #       format.html { render :edit, status: :unprocessable_entity }
      #       format.json { render json: @review.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      # DELETE /reviews/1 or /reviews/1.json
      def destroy
        if @review.destroy!
          head :no_content
        else
          render json: @review.errors, status: :unprocessable_entity #Handle with frontend
        end
        # @review.destroy!

        # respond_to do |format|
        #   format.html { redirect_to reviews_path, status: :see_other, notice: "Review was successfully destroyed." }
        #   format.json { head :no_content }
        # end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_review
          @review = Review.find(params.expect(:id))
        end

        # Only allow a list of trusted parameters through.
        def review_params
          params.expect(review: [ :rating, :comment, :user_id, :trail_id, :date ])
        end
    end
  end
end
