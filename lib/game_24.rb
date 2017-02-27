# The class of Game24
class Game24Calculator

  def initialize(params = {})
    @array      = params[:array]
    @value      = params[:value] || 24
    @operations = %w(+ - * /).repeated_permutation(@array.size - 1).to_a
    @hash = {}
    @ans  = nil
  end

  # The calculator of (num1 op num2)
  def cal(num1, operation, num2)
    num1, num2 = num1.to_f, num2.to_f
    case operation
    when "+" then num1 + num2
    when "-" then num1 - num2
    when "*" then num1 * num2
    when "/" then num1 / num2
    end
  end

  # Process the arr by op
  def try(arr = [], op = [])
    return {arr[0].to_s => arr[0]} if arr.size == 1
    
    arr = arr.sort if op.all?{|tmp| tmp == "+"} || op.all?{|tmp| tmp == "*"}
    arr = [arr[0]] + arr[1..-1].sort if op.all?{|tmp| tmp == "/"}

    exp = arr.zip(op).flatten.map(&:to_s).join
    return {exp => @hash[exp]} if @hash[exp]

    hash = {}

    (0..arr.size-2).map do |i|
      left_arr  = arr[0..i]
      right_arr = arr[i+1..arr.size-1]

      left_op   = 0 > i-1 ? [] : op[0..i-1]
      right_op  = op[i+1..arr.size-2]

      num1 = try(left_arr, left_op)
      num2 = try(right_arr, right_op)

      num1.each do |exp1, n1|
        num2.each do |exp2, n2|
          ans = cal(n1, op[i], n2)
          left =  left_arr.size > 1 ? "(#{exp1})" : exp1
          right = right_arr.size > 1 ? "(#{exp2})" : exp2

          if (op[i] == "+" || op[i] == "*") && n1 > n2
            temp = "#{right}#{op[i]}#{left}"
          else
            temp = "#{left}#{op[i]}#{right}"
          end
          hash[temp] = ans
        end
      end
    end

    @hash.merge!(hash)
    hash
  end

  # To get the ans
  def work
    @array.permutation.to_a.uniq.each do |arr|
      @operations.each do |op|
        try(arr.map(&:to_f), op)
      end
    end
    @ans = @hash.keep_if{|k, v| v == @value.to_f && k.scan(/[\+\-\*\/]/).size == 3}.keys
    @ans
  end

end
