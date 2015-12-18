require 'spec_helper'

RSpec.describe School, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:school)).to be_valid
  end
  it "is invalid without number of classes" do
    expect(FactoryGirl.build(:school, num_of_grades: nil)).not_to be_valid
  end
  it "generates pupils" do
    pupils = FactoryGirl.create(:school_with_pupils)
    expect(pupils).to be_valid
  end
end
