class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.string   :name
      t.string   :language
      t.integer  :stargazers_count
      t.integer  :watchers_count
      t.integer  :forks_count
      t.text     :html_url
      t.text     :description 
      t.datetime :creation_date
      t.datetime :update_date
      t.timestamps
    end
  end
end
