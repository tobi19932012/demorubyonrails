class Backend::Comment < ApplicationRecord
  belongs_to :news
  belongs_to :user
end
