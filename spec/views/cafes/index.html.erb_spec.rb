require 'spec_helper'

describe "cafes/index" do
  before(:each) do
    assign(:cafes, [
      stub_model(Cafe,
        :name => "Name",
        :address => "Address",
        :lat => 1.5,
        :lng => 1.5,
        :roaster => "Roaster"
      ),
      stub_model(Cafe,
        :name => "Name",
        :address => "Address",
        :lat => 1.5,
        :lng => 1.5,
        :roaster => "Roaster"
      )
    ])
  end

  it "renders a list of cafes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Roaster".to_s, :count => 2
  end
end
