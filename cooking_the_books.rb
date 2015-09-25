# Define a general "Solve problem" method

def solve(problem)

  # Output in format according to problem requirements
  "#{solve_for_smallest(problem.dup)} #{solve_for_largest(problem.dup)}"
end

# Define methods for solving sub-problems (smallest and largest possible numbers)

# SOLVE FOR SMALLEST POSSIBLE NUMBER
#
# Algorithm description:
# start from the first digit, and for each digit in the number
#  search for a smaller digit nr to the right of the current digit
#   if it exists && the current digit index is not 0
#     replace the current digit nr with the discovered digit nr
#     done
def solve_for_smallest(problem)

  index = 0
  problem.each_char do |nr|

    subproblem = problem[index...problem.length].split("").map(&:to_i)

    min = subproblem.min

    if min < nr.to_i && !(index == 0 && min == 0)

      subindex = 0
      problem.reverse.each_char do |subnr|
        if subnr.to_i == min
          break
        end
        subindex += 1
      end

      replace_index = problem.length-1-subindex

      problem[replace_index] = nr.to_s
      problem[index] = min.to_s

      break
    end

    index += 1
  end

  "#{problem}"
end

# SOLVE FOR LARGEST POSSIBLE number
#
# Algorithm description:
# start from the first digit, and for each digit in the number
#  search for a larger nr to the right of the nr
#   if it exists && the current index isnt 0
#     replace the current digit nr with the discovered digit nr
#     done
def solve_for_largest(problem)

  index = 0
  problem.each_char do |nr|

    subproblem = problem[index...problem.length].split("").map(&:to_i)

    max = subproblem.max

    if max > nr.to_i

      subindex = 0
      problem.reverse.each_char do |subnr|
        if subnr.to_i == max
          break
        end
        subindex += 1
      end

      replace_index = problem.length-1-subindex

      problem[replace_index] = nr.to_s
      problem[index] = max.to_s

      break
    end

    index += 1
  end

  "#{problem}"
end

# Read input
problems = File.readlines("cooking_the_books_example_input.txt")
T = problems.shift # See Problem Constraints

# Iterate each number/problem
count = 1
while problems.any?
  problem = problems.shift

  # Solve each problem
  puts "Case ##{count}: " + solve(problem.strip)

  count += 1
end
