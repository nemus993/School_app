require 'spec_helper'

RSpec.describe SchoolsController, type: :controller do
  before :all do
    sign_in :user
  end
  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

end
