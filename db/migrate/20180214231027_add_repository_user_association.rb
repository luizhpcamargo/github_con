class AddRepositoryUserAssociation < ActiveRecord::Migration[5.1]
  def change
    add_reference :repositories, :user, index: true
  end
end
