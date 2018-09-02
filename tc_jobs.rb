require_relative "jobs"
require "test/unit"

def assert_substring_before string, first_substring, second_substring
  assert_true(string.index(first_substring) < string.index(second_substring))
end

def assert_same_jobs hash
  assert_equal(hash.keys.sort, order_jobs(hash).sort)
end


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
    assert_same_jobs(input)
  end

  def test_one_constraint
    input = {
      'a' => 'b',
      'b' => nil,
    }
    assert_same_jobs(input)
    output = order_jobs(input)
    assert_substring_before(output, 'b', 'a')
  end
  
end
