FactoryBot.define do
  factory :repository do
    name "Fake Repo"
    language "Ruby"
    stargazers_count 9000
    watchers_count 9000
    forks_count 9000
    html_url 'github.com/fakerepo'
    description 'This is a fake repo'
    creation_date DateTime.now
    update_date DateTime.now
  end
end
