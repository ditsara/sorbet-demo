# typed: false
require 'rails_helper'

RSpec.describe "line_items/show", type: :view do
  before(:each) do
    @line_item = assign(:line_item, LineItem.create!(
      :narrative => "Narrative",
      :amount => "9.99",
      :account => nil,
      :transaction => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Narrative/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
