acct_ar = Account.create! name: "Accounts Receivable"
acct_rv = Account.create! name: "Revenue"
acct_bk = Account.create! name: "Bank"

Transaction.create! narrative: "example sale transaction", status: :approved, line_items: [
  LineItem.new(narrative: "Widget Sale", amount: 100, account: acct_ar),
  LineItem.new(narrative: "Widget Sale", amount: -100, account: acct_rv),
  LineItem.new(narrative: "Payment on Widget Sale", amount: -100, account: acct_ar),
  LineItem.new(narrative: "Payment on Widget Sale", amount: 100, account: acct_bk),
]
