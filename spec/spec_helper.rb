require "coveralls"
Coveralls.wear! do
  add_filter "/spec/"
end

require "pry"
require "rspec"

if RUBY_ENGINE == "ruby"
  def calculate_stack_overflow_depth(n)
    calculate_stack_overflow_depth(n + 1)
  rescue SystemStackError
    n
  end
  STACK_OVERFLOW_DEPTH = calculate_stack_overflow_depth(2)
else
  STACK_OVERFLOW_DEPTH = 16_384
end

class DeterministicHash

  def initialize(value, hash)
    @value = value
    @hash = hash
  end

  def to_s
    @value.to_s
  end

  def inspect
    @value.inspect
  end
  def hash
    @hash
  end
end
