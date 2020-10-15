class Case
  attr_accessor :case_name

  def initialize(case_name, marker="   ")
    @case_name = {case_name => marker}
  end

  def is_position_empty?(choice)
    @case_name[choice] == "   " ? true : false
  end

  def replace_value(choice,player_marker)
    @case_name[choice] = " #{player_marker} "
  end

end