# The class of Game24
class Game24

  def initialize(params = {})
    array = params[:array]
    @hash = {}
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

end