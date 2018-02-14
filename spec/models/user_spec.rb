require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:repositories).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:login) }
    it { is_expected.to validate_presence_of(:html_url) }
  end
end
