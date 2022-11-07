class InstructorsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = Instructor.update!(instructor_params)
        render json: instructor, status: :accepted
    end

    private

    def record_not_found
        render json: {error: "Instructor not found"}, status: :not_found
    end

    def invalid_record(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def instructor_params
        params.permit(:name)
    end

end
