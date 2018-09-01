require_relative "jobs"
require "test/unit"

class TestOrderJobs < Test::Unit::TestCase

  def test_empty_string
    assert_equal([], order_jobs(''))
  end

  def test_one_job
    assert_equal(['a'], order_jobs({'a' => nil}))
  end

  def test_many_unordered_jobs
    input = {
      'a' => nil,
      'c' => nil,
      'b' => nil, #in strange order as test shouldn't rely on key order
    }
    assert_equal(['a', 'b', 'c'], order_jobs(input).sort)
  end

end
