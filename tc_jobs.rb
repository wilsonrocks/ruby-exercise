require_relative "jobs"
require "test/unit"
  
class TestOrderJobs < Test::Unit::TestCase

  def test_empty_string
    assert_equal([], order_jobs(''))
  end

  
end