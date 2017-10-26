class Backend::News < ApplicationRecord
  belongs_to :category
  has_many :comments , dependent: :destroy
  extend FriendlyId
  friendly_id :title  , use:  [:slugged, :finders]
  has_many :users, through: :comments
  has_attached_file :images, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path('missingmot.png')
  validates_attachment_content_type :images, content_type: /\Aimage\/.*\z/
  # after_create :create_category , on: [:create , :update]


end
