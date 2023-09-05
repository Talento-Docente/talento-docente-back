class Api::ApplicantsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::ApplicantsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update]

  def before_update_method
    if params[:user_attributes][:picture].blank? || params[:user_attributes][:picture] == "null"
      _element.user.picture.purge if _element.user.picture.attached?
      params[:user_attributes].delete(:picture)
    end

    if params[:curriculum].blank? || params[:curriculum] == "null"
      _element.curriculum.purge if _element.curriculum.attached?
      params.delete(:curriculum)
    end
  end

  def init_search_helper
    prepare_search(
      model: Applicant,
      class_name: CLASS_NAME,
      params: params,
      search_params: search_params,
      element_params: element_params,
      services: %w[index show update create destroy],
      current_user: current_user,
      required_parent_model: false,
      excluded: []
    )
  end

  def search_params
    params
      .permit(
        :page,
        :page_size,
        :sort_order,
        :sort_field,
        search_by: [
          :description,
          :profesional_experience,
          :phone,
          :youtube,
          :linkedin,
          :briefcase,
          :twitter,
          :english_level,
          :visible
        ]
      )
  end

  def element_params
    params
      .permit(
        :description,
        :profesional_experience,
        :phone,
        :youtube,
        :linkedin,
        :briefcase,
        :twitter,
        :english_level,
        :curriculum,
        user_attributes: [
          :id,
          :dni,
          :first_name,
          :last_name,
          :second_last_name,
          :birthday,
          :email,
          :name,
          :picture,
          :visible,
          :skip_password_validation,
          :password,
          :password_confirmation
        ]
      )
  end

end
