require 'spec_helper'

describe "cafes/show" do
  before(:each) do
    @cafe = assign(:cafe, stub_model(Cafe,
      :name => "Name",
      :address => "Address",
      :lat => 1.5,
      :lng => 1.5,
      :roaster => "Roaster"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Roaster/)
  end
end
