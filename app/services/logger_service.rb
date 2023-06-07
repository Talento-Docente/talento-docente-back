class LoggerService

  attr_reader :class_name, :method, :user

  def initialize(class_name: nil, method: nil, user: nil)
    @class_name = class_name
    @method = method
    @user = user
  end

  def prepare(method: nil, user: nil)
    @method = method if method.present?
    @user = user if user.present?
  end

  def debug(method: nil, message: nil, user: "-")
    prepare(method: method, user: user)
    Rails.logger.debug "[#{DateTime.now}][#{@class_name}##{@method}][#{@user}][debug] #{message}"
  end

  def info(method: nil, message: nil, user: "-")
    prepare(method: method, user: user)
    Rails.logger.info "[#{DateTime.now}][#{@class_name}##{@method}][#{@user}][info] #{message}"
  end

  def warn(method: nil, message: nil, user: "-")
    prepare(method: method, user: user)
    Rails.logger.warn "[#{DateTime.now}][#{@class_name}##{@method}][#{@user}][warn] #{message}"
  end

  def error(method: nil, message: nil, user: "-")
    prepare(method: method, user: user)
    Rails.logger.error "[#{DateTime.now}][#{@class_name}##{@method}][#{@user}][error] #{message}"
  end

end
