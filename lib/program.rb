# Returns whether the set of operators performed on the set of numbers can produce the target.
# Each number must be used once and only once; each operator may be used any arbitrary number of times.
def operate(numbers, operators, target)
    return false if numbers.nil? || operators.nil? || numbers.empty? || operators.empty?
    results = []
    numbers.each { |num| operate_impl(results, [num], numbers.reject { |x| x == num }, operators, target, 0 )}
    results.each do |result|
        print "#{result.inspect} = "
        answer = solve(result)
        puts "#{answer}"
        return true if answer == target
    end
    return false
end

def operate_impl(results, intermediate_results, numbers, operators, target, recursion_index)
    # recursion_index.times { print "\t" } ; puts "Results: #{results}, Numbers: #{numbers}"
    if numbers.empty?
        results << intermediate_results
        return results
    end
    operators.each do |operator|
        numbers.each { |num| operate_impl(results, intermediate_results + [operator, num], numbers.reject { |x| x == num }, operators, target, recursion_index + 1 )}
    end
end

def solve(result)
    answer = nil
    return result.first if result.length == 1
    a = result.shift
    op = result.shift
    b = result.shift
    answer = a.to_f + b.to_f if op == '+'
    answer = a.to_f - b.to_f if op == '-'
    answer = a.to_f * b.to_f if op == '*'
    answer = a.to_f / b.to_f if op == '/'
    loop do
        break if result.empty?
        op = result.shift
        b = result.shift
        answer += b.to_f if op == '+'
        answer -= b.to_f if op == '-'
        answer *= b.to_f if op == '*'
        answer /= b.to_f if op == '/'
    end
    return answer
end

operate([1, 3, 4, 6], %w(+ - * /), 24)