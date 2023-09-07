class AuthApplicationController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_user!
  before_action :active_store_host
  serialization_scope :view_context

  def active_store_host
    if Rails.application.config.active_storage.service == :local
      TalentoDocenteBack::Application.default_url_options = { host: 'http://localhost:3000' }
      ActiveStorage::Current.url_options = { host: 'http://localhost:3000' }
    end
  end

  def current_user_id
    current_user&.id
  end

  def current_establishment
    current_user&.establishments&.where(id: params[:establishment_id])&.first
  end

  def paginate(objects)
    {
      current_page: objects.current_page,
      page: objects.current_page,
      next_page: objects.next_page,
      prev_page: objects.prev_page,
      page_size: objects.size,
      total_pages: objects.total_pages,
      total_elements: objects.total_count,
      totalCount: objects.total_count,
    }
  end
end
