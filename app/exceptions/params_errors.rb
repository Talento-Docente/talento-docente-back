module ParamsErrors
  class YearNotFound < StandardError
    attr_reader :message

    def initialize(message = "Se require determinar año")
      @message = message
    end
  end

  class MonthNotFound < StandardError
    attr_reader :message

    def initialize(message = "Se require determinar mes")
      @message = message
    end
  end

  class StartYearNotFound < StandardError
    attr_reader :message

    def initialize(message = "Se require determinar año de inicio")
      @message = message
    end
  end

  class StartMonthNotFound < StandardError
    attr_reader :message

    def initialize(message = "Se require determinar mes de inicio")
      @message = message
    end
  end

  class EndYearNotFound < StandardError
    attr_reader :message

    def initialize(message = "Se require determinar año de termino")
      @message = message
    end
  end

  class EndMonthNotFound < StandardError
    attr_reader :message

    def initialize(message = "Se require determinar mes de termino")
      @message = message
    end
  end

  class NotFound < StandardError
    attr_reader :message

    def initialize(message = "Elemento no encontrado")
      @message = message
    end
  end

  class ServiceNotRegister < StandardError
    attr_reader :message

    def initialize(message = "Servicio no registrado")
      @message = message
    end
  end

  class ParamsNotFound < StandardError
    attr_reader :message

    def initialize(message = "parametro")
      @message = "No se especifica #{message}"
    end
  end

  class ModelNotFound < StandardError
    attr_reader :message

    def initialize(message = "modelo")
      @message = "No se encuentra #{message}"
    end
  end
end
