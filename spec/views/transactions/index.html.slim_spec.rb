# typed: false
require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :narrative => "Narrative",
        :status => 2
      ),
      Transaction.create!(
        :narrative => "Narrative",
        :status => 2
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => "Narrative".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
