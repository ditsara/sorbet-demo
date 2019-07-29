# typed: false
require 'rails_helper'

RSpec.describe "line_items/index", type: :view do
  before(:each) do
    assign(:line_items, [
      LineItem.create!(
        :narrative => "Narrative",
        :amount => "9.99",
        :account => nil,
        :transaction => nil
      ),
      LineItem.create!(
        :narrative => "Narrative",
        :amount => "9.99",
        :account => nil,
        :transaction => nil
      )
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", :text => "Narrative".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
