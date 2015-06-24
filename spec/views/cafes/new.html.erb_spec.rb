require 'spec_helper'

describe "cafes/new" do
  before(:each) do
    assign(:cafe, stub_model(Cafe,
      :name => "MyString",
      :address => "MyString",
      :lat => 1.5,
      :lng => 1.5,
      :roaster => "MyString"
    ).as_new_record)
  end

  it "renders new cafe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cafes_path, "post" do
      assert_select "input#cafe_name[name=?]", "cafe[name]"
      assert_select "input#cafe_address[name=?]", "cafe[address]"
      assert_select "input#cafe_lat[name=?]", "cafe[lat]"
      assert_select "input#cafe_lng[name=?]", "cafe[lng]"
      assert_select "input#cafe_roaster[name=?]", "cafe[roaster]"
    end
  end
end
