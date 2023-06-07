class Array
  def sort_by_date(direction = "ASC")
    if direction == "ASC"
      self.sort
    elsif direction == "DESC"
      self.sort { |a, b| b <=> a }
    else
      raise "Invalid direction. Specify either ASC or DESC."
    end
  end
end
