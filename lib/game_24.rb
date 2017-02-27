# The class of Game24
class Game24

  OPERATIONS = %w(+ - * /).repeated_permutation(3).to_a

  def initialize(params = {})
    @array = params[:array]
    @hash = {}
    @ans
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

    if op.all?{|tmp| tmp == "*" || tmp == "/"} && op.inject(0){|sum, tmp| sum += tmp == "/" ? 1 : 0} == 1
      tmp = op.index("/") || op.index("-")
      arr[tmp+1], arr[-1] = arr[-1], arr[tmp + 1]
      op[tmp],    op[-1]  = op[-1],  op[tmp]
      arr = arr[0..-2].sort << arr[-1]
    end

    exp = arr.zip(op).flatten.map(&:to_s).join
    return {exp => @hash[exp]} if @hash[exp]

    hash = {}

    (0..arr.size-2).map do |i|
      left_arr  = arr[0..i]
      right_arr = arr[i+1..arr.size-1]

      left_op   = 0 > i-1 ? [] : op[0..i-1]
      right_op  = op[i+1..arr.size-2]

      if left_op.all?{|tmp| tmp == "*"} || left_op.all?{|tmp| tmp == "+"}
        num1 = try(left_arr.sort, left_op)
      elsif left_op.all?{|tmp| tmp == "/"}
        num1 = try([left_arr[0]] + left_arr[1..-1].sort, left_op)
      else
        num1 = try(left_arr, left_op)
      end

      if right_op.all?{|tmp| tmp == "*"} || right_op.all?{|tmp| tmp == "+"}
        num2 = try(right_arr.sort, right_op)
      elsif right_op.all?{|tmp| tmp == "/"}
        num2 = try([right_arr[0]] + right_arr[1..-1].sort, right_op)
      else
        num2 = try(right_arr, right_op)
      end

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
      OPERATIONS.each do |op|
        try(arr.map(&:to_f), op)
      end
    end
    @ans = @hash.keep_if{|k, v| v == 24.0 && k.scan(/[\+\-\*\/]/).size == 3}.keys
    @ans
  end

end
