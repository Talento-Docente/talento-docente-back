# Add a rut_valid? method to the String class.

class String
  ##
  # Validates if the string has the rut/run syntax and
  # calculates/validate the digit
  # @return [true, false]
  def rut_valid?
    if not (self =~ /\A(\d{7,8})\-(\d{1}|k|K)\Z/i) and not (self =~ /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|K|\d{1})\Z/)
      return false
    end

    results = Array.new
    rut = self.strip.split("-").first.delete(".").to_i
    numerical_serie = 2

    while rut > 0
      results.push (rut % 10) * numerical_serie
      rut = rut / 10
      numerical_serie += 1
      numerical_serie = 2 if numerical_serie > 7
    end

    digit = 11 - (results.inject(:+) % 11)

    if digit == 10
      digit = "k"
    elsif digit == 11
      digit = "0"
    else
      digit = digit.to_s
    end

    if digit == self.strip.split("-").last.downcase
      return true
    else
      return false
    end
  end

  def underscore
    self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z\d])([A-Z])/, '\1_\2').
      tr("-", "_").
      downcase
  end

  def snakecase
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z\d])([A-Z])/, '\1_\2').
      tr('-', '_').
      gsub(/\s/, '_').
      gsub(/__+/, '_').
      downcase
  end

  def get_multi
    [2, 3, 4, 5, 6, 7, 2, 3, 4, 5, 6, 7]
  end

  def get_validdv
    Array(0...9) + %w[k K]
  end

  def is_integer?
    self.to_i.to_s == self
  end

  def rut_raw
    self.gsub(/[^0-9 k K]/, "").downcase
  end

  def rut_strip_digit
    dni = self.rut_raw.reverse.from(1).split("").map(&:to_i)
    dni.insert(3, '.').insert(7, '.').reverse.join.to_s
  end

  def rut_strip_dots
    self.gsub(/[^0-9 k K -]/, "")
  end

  def rut_length
    return true if self.rut_raw.length <= 9 && self.rut_raw.length >= 7
    return false
  end

  def get_dv(rut)
    rut = raw(rut).reverse.split("").map(&:to_i)
    (11-(rut.zip(get_multi).map { |x,y| x*y }.reduce(:+)%11)).to_s.gsub(/10/,'k').gsub(/11/,'0')
  end

  def rut_get_dv
    dni = self.rut_raw.reverse.split("").map(&:to_i)
    (11 - (dni.zip(get_multi).map { |x, y| x * y }.reduce(:+) % 11)).to_s.gsub(/10/, 'k').gsub(/11/, '0')
  end

  def rut_is_valid?
    self.rut_length && self.rut_strip_digit.rut_get_dv.downcase == self.rut_raw.last.downcase
  end

  ## Generate
  def rut_generate
    num = (10000000 + rand(89999999)).to_s
    num = num.to_s + num.rut_get_dv.to_s
    num.rut_format
  end

  ## Format
  def rut_format
    dni = self.rut_raw.reverse.from(1).split("").map(&:to_i)
    dni = dni.insert(3, '.').insert(7, '.').reverse.join.to_s
    [dni, dni.rut_get_dv.to_s].join('-')
  end

end
