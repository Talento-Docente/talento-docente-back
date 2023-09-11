# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  birthday               :date
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  deleted_at             :datetime
#  dni                    :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  image                  :string
#  last_name              :string
#  name                   :string
#  nickname               :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("super_admin")
#  second_last_name       :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
class User < ActiveRecord::Base

  # Constants
  ROLE_SUPER_ADMIN = 'super_admin'
  ROLE_ESTABLISHMENT = 'establishment'
  ROLE_APPLICANT = 'applicant'

  # Devise Import
  include DeviseTokenAuth::Concerns::User

  # Attributes
  attr_accessor :skip_password_validation # virtual attribute to skip password validation while saving

  # Devise Configuration
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable

  # Active Storage
  has_one_attached :picture

  # Relationship
  has_one :applicant
  has_many :permissions
  has_many :establishments, through: :permissions, class_name: "Establishment"
  has_many :postulations, through: :applicant, class_name: "Postulation"
  has_many :work_experiences, through: :applicant, class_name: "WorkExperience"
  has_many :academic_trainings, through: :applicant, class_name: "AcademicTraining"
  has_many :skills, through: :applicant, class_name: "Skill"

  # Soft Delete
  acts_as_paranoid
  validates_as_paranoid

  # Callback
  before_save :format_rut
  # before_save :set_password

  # Validate
  validates_uniqueness_of_without_deleted :dni
  # validate :valid_dni

  # Enums
  enum role: [
    ROLE_SUPER_ADMIN,
    ROLE_ESTABLISHMENT,
    ROLE_APPLICANT
  ]

  # Methods
  def format_rut
    self.dni = dni.rut_raw if dni.present?
  end

  def valid_dni
    unless dni.present?
      errors.add(:dni, "Rut no puede estar vacío")
    end

    if dni.present? && !dni.gsub(/[^0-9Kk]/, '').rut_is_valid?
      errors.add(:dni, "Rut inválido")
    end
  end

  def token_validation_response
    Api::UserSerializer.new( self, root: false ).as_json
  end

  # def set_password
  #   if self.encrypted_password.nil? || self.encrypted_password === ""
  #     puts "is null"
  #     self.password = self.dni[0...5]
  #     self.password_confirmation = self.dni[0...5]
  #   end
  # end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end

end
