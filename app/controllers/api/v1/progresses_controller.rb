class Api::V1::ProgressesController < ApplicationController
  def index
    render json: Progress.search(index_params[:word_id], 1)
  end

  def create
    progress = Progress.new(progress_params)
  
    if progress.save
      render :json => progress, :status => 201
    else
      render :json => { :errors => progress.errors.full_messages }, :status => 422
    end
  end

  def update
    progress = Progress.find(progress_params[:id])

    if progress.update_attributes(progress_params)
      render :json => progress
    else
      render :json => { :errors => progress.errors.full_messages }, :status => 422
    end
  end

  private

  def progress_params
    params.require(:progress).permit(:id, :word_id, :user_id, :translation, :example, :seen, :learnt, :count)
  end

  def index_params
  	params.permit(:word_id)
  end
end
