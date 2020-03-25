require 'rails_helper'

RSpec.describe Measure, type: :model do
  it { should have_many(:values).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
