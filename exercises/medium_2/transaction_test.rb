require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(50)
  end

  def test_prompt_for_payment
    test_input = StringIO.new("50\n")
    test_output = StringIO.new
    @transaction.prompt_for_payment(input: test_input, output: test_output)
    
    assert_equal 50, @transaction.amount_paid
  end
end
