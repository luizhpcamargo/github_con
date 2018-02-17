class Repository < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id

  validates_presence_of :name, :language, :stargazers_count, :html_url
end
