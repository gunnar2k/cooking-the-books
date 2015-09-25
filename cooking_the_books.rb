def solve(problem)
  # puts "Problem: " + problem
  "#{solve_for_smallest(problem.dup)} #{solve_for_largest(problem.dup)}"
end

def solve_for_smallest(problem)

  # puts "Problem="+problem

  # for each nr in set
  #  search for a smaller nr to the right of the nr
  #   if it exists && the current index isnt 0
  #     replace the smaller nr with the current nr
  #     break out of loop

  index = 0
  problem.each_char do |nr|

    subproblem = problem[index...9999999999].split("").map(&:to_i)

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

def solve_for_largest(problem)

  # puts "Problem="+problem

  # for each nr in set
  #  search for a smaller nr to the right of the nr
  #   if it exists && the current index isnt 0
  #     replace the smaller nr with the current nr
  #     break out of loop

  index = 0
  problem.each_char do |nr|

    subproblem = problem[index...9999999999].split("").map(&:to_i)

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

problems = File.readlines("cooking_the_books_example_input.txt")
T = problems.shift

count = 1
while problems.any?

  problem = problems.shift

  puts "Case ##{count}: " + solve(problem.strip)
  # puts "\n"
  count += 1
end
