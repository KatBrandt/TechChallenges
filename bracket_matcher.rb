# Rules
# 1. input of string, will be a set of brackets/parenthesis.
# 2. Looking to make sure there is both an open and closed brackets
# 3. brackets will need to be opened/closed in the correct order.
# 4. Return TRUE if well-formed, else, return FALSE.
# 5. Method name `bracket` takes a string argument 

# Clarifying Questions:
# Will I only be dealing with {} [] () ? Could there be other inputs? 
# Like numbers or text between the brackets? 

# PseudoCode
# - Take string and create an array with each character.
# '{()}'
# [ {, (, ), } ]

# use a hash to store values for these brackets, a positive number for the opening
# and a negative number for the close so that open + close = 0.
# Then start at beginning of array plus end of array (length - current_index) and 
# make sure they are equal to 0.
# I can see this having an if stmt inside an iterator though, plus I'm creating this new
# has... so maybe not the most performant. 
# Let's try though.

# Changed this to instead reverse the array of brackets, then compare the first
# half of the first array to the first half of the second array and if they 
# sum to 0, return true.

class BracketMatcher
  def initialize
    @matches = {
      "{" => 1,
      "}" => -1,
      "[" => 2,
      "]" => -2,
      "(" => 3,
      ")" => -3
    }
  end

  def bracket(string)
    return false if (string.length % 2 == 1)

    brackets = string.chars
    test_brackets = brackets.reverse

    test_range = (brackets.length) / 2

    clean = true

    test_range.times do |i|
      result = @matches[brackets[i]] + @matches[test_brackets[i]]
      if result != 0
        clean = false
        break
      end
    end
    clean
  end
end

test = BracketMatcher.new
a = test.bracket('{[]}')
b = test.bracket('{[(())]}')
c = test.bracket('({)[]}')
d = test.bracket('{[])}')
require 'pry'; binding.pry
d = test.bracket('{[])}')

Could also do this with a stack approach. 
Make a hash with the opening bracket as the key and it's corresponding
closing bracket as the value. 
Go through the string and if I encounter an opening bracket, push it onto the
stack (array).
If it's not an opening bracket, check to see if it's a closing bracket 

def validate(input_string)
  valid_pairs = { '(' => ')',
                  '{' => '}',
                  '[' => ']' 
                }
  stack = []

  input_string.chars.each do |character|
    if valid_pairs.has_key?(character)
      stack.push(character)
    elsif valid_pairs[stack.last] == character
      stack.pop
    elsif valid_pairs.has_value?(character)
      return false
    end
  end

  return stack.count.zero?
end