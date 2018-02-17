require 'rails_helper'

RSpec.describe Repository, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:owner) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:stargazers_count) }
    it { is_expected.to validate_presence_of(:html_url) }
  end
end
