class Backend::Category < ApplicationRecord
  # DEFAULT_PER_PAGE = AVAILABLE_PER_PAGES.first
  # DEFAULT_PER_PAGE = AVAILABLE_PER_PAGES.first
  # DEFAULT_SORT_BY_COLUMN = :created_at
  # paginates_per AVAILABLE_PER_PAGES.first
  has_many :news
  validates :name, presence: true


  extend FriendlyId
  friendly_id :name , use:  [:slugged, :finders]

  private

  def show_category_layout
    @backend_category = Backend::Category.where(status: true).all
  end
end
