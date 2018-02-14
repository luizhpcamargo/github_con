class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :login
      t.text     :avatar_url
      t.text     :html_url
      t.timestamps
    end
  end
end