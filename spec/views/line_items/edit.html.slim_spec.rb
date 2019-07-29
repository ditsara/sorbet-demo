# typed: false
require 'rails_helper'

RSpec.describe "line_items/edit", type: :view do
  before(:each) do
    @line_item = assign(:line_item, LineItem.create!(
      :narrative => "MyString",
      :amount => "9.99",
      :account => nil,
      :transaction => nil
    ))
  end

  it "renders the edit line_item form" do
    render

    assert_select "form[action=?][method=?]", line_item_path(@line_item), "post" do

      assert_select "input[name=?]", "line_item[narrative]"

      assert_select "input[name=?]", "line_item[amount]"

      assert_select "input[name=?]", "line_item[account_id]"

      assert_select "input[name=?]", "line_item[transaction_id]"
    end
  end
end
