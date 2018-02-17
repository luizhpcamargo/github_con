class User < ApplicationRecord

  validates_presence_of :login, :html_url
end
