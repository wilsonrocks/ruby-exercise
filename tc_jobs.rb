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
      'c' => nil,
    }
    assert_same_jobs(input)
    output = order_jobs(input)
    assert_substring_before(output, 'b', 'a')
  end

  def test_two_constraints
    input = {
      'a' => 'b',
      'b' => 'c',
      'c' => nil,
    }
    assert_same_jobs(input)
    output = order_jobs(input)
    assert_substring_before(output, 'b', 'a')
    assert_substring_before(output, 'c', 'b')
  end

  def test_many_independent_constraints
    input = {
      'a' => 'b',
      'b' => 'c',
      'c' => nil,
      'd' => 'e',
      'e' => 'f',
      'f' => nil,
    }
    assert_same_jobs(input)
    output = order_jobs(input)
    assert_substring_before(output, 'b', 'a')
    assert_substring_before(output, 'c', 'b')
    assert_substring_before(output, 'e', 'd')
    assert_substring_before(output, 'f', 'e')
  end

  def test_common_dependencies

    input = {
      'a' => 'd',
      'b' => 'd',
      'c' => 'd',
      'd' => nil,
    }

    assert_same_jobs(input)

    output = order_jobs(input)
    assert_substring_before(output, 'd', 'a')
    assert_substring_before(output, 'd', 'b')
    assert_substring_before(output, 'd', 'c')
  end

  def test_self_dependency

    input = {
      'a' => 'a'
    }

    assert_raise_message('Jobs cannot depend on themselves!') do
      order_jobs(input)
    end

  end

  def test_circular_dependency
    input = {
      'a' => 'b',
      'b' => 'a',
    }

    assert_raise_message('Jobs cannot have circular dependencies') do
      order_jobs(input)
    end

  end



end
