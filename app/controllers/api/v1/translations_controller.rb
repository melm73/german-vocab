class Api::V1::TranslationsController < ApplicationController
  def index
    translations = Translation.where(user_id: index_params[:user_id]).map do |translation|
      {
        id: translation.id,
        word_id: translation.word_id,
        translation: translation.translation,
        example: translation.example,
        learnt: translation.learnt,
        level: translation.level,
        review_count: translation.review_count,
        last_review: translation.last_review
      }
    end

    render json: translations
  end

  def edit
    translation = Translation.where(user_id: index_params[:user_id], word_id: index_params[:word_id]).first

    render json: translation
  end

  def review
    translations = Translation.where(user_id: 1).reject do |translation|
      translation.learnt
    end.map do |translation|
      {
        id: translation.id,
        german: translation.word.german,
        article: translation.word.article,
        plural: translation.word.plural,
        translation: translation.translation,
        example: translation.example,
      }
    end.sample(10)

    render json: translations
  end

  def progress
    progress = Translation.where(user_id: index_params[:user_id]).map do |translation|
      {
        id: translation.id,
        translation: translation.translation,
        learnt: translation.learnt,
        level: translation.level,
        review_count: translation.review_count,
        last_review: translation.last_review
      }
    end

    render json: progress
  end

  def create
    translation = Translation.new(translation_params)
  
    if translation.save
      render :json => translation, :status => 201
    else
      render :json => { :errors => translation.errors.full_messages }, :status => 422
    end
  end

  def update
    translation = Translation.find(translation_params[:id])

    if translation.update_attributes(translation_params)
      render :json => translation
    else
      render :json => { :errors => translation.errors.full_messages }, :status => 422
    end
  end

  private

  def translation_params
    params.require(:translation).permit(:id, :word_id, :user_id, :translation, :example, :known)
  end

  def index_params
  	params.permit(:user_id, :word_id)
  end
end
