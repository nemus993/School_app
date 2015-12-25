require 'spec_helper'

RSpec.describe School, type: :model do

  it { should have_many(:pupils) }

  [:title, :num_of_grades].each do |attribute|
    it {should respond_to attribute}
  end
  it "has a valid factory" do
    expect(FactoryGirl.create(:school)).to be_valid
  end
  it "is invalid without number of classes" do
    school = FactoryGirl.build(:school, num_of_grades: nil)
    expect(school).not_to be_valid
  end
  it "generates pupils" do
    pupils = FactoryGirl.create(:school_with_pupils)
    expect(pupils).to be_valid
  end
end
