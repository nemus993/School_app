require 'spec_helper'

describe "the school interface" do
  before(:all) do
    @schools = []
    5.times { @schools << FactoryGirl.create(:school) }
  end
  describe "on index page" do
    before (:each) do
      visit schools_path
    end
    it "lists all schools" do
      @schools.each do |school|
        page.should have_content(school.title)
      end
    end
    it "should have link to school details" do
      @schools.each do |school|
        page.should have_link("Details", href: school_path(school))
      end
    end
    it "should have link for creating new school" do
      page.should have_content("New School")
      click_button "New School"
      current_path.should eq(new_school_path)
    end
  end
  it "goes to school when form filled" do
    school = FactoryGirl.build(:school, title: "Sunce")
    visit new_school_path
    fill_in "School name", :with => school.titles
    click_button "Create"
    current_path.should eq(school_path(school))
    page.should have_content("Sunce")
  end
  describe "on school details page" do
    before (:all) do
      @school = FactoryGirl.create(:school_with_pupils)
      visit school_path(@school)
    end
    it "should have school title and number of classes" do
      page.should have_content(@school.title)
      page.should have_content(@school.num_of_grades)
    end
    it "has button for generating new pupils" do
      page.should have_content("Generate pupils")
    end
    it "generates pupils and lists them" do
      click_button("Generate pupils")
      page.should have_selector("table#pupils_table")
    end
    it "should have button to go back to index page" do
      page.should have_link("Back", href: schools_path)
      click_button "Back"
      current_path.should eq(schools_path)
    end
    it "should have button for sorting pupils" do
      page.should have_content("Sort pupils")
      click_button "Sort pupils"
      current_path.should eq(sort_school_path)
    end
  end
end
