require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(0)
    @transaction = Transaction.new(20)
    @transaction.amount_paid = 100
  end

  def test_accept_money
    initial_money = @cash_register.total_money
    @cash_register.accept_money(@transaction)
    current_money = @cash_register.total_money

    assert_equal(initial_money + 100, current_money)
  end

  def test_change
    assert_equal(80, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $20.\n") { @cash_register.give_receipt(@transaction) }
  end
end
