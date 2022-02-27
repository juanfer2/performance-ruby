# require "#{Rails.root}/lib/caching/base_cache"
class UsersCaching
  attr_reader :users

  def initialize
    super()
  end

  def write
    Rails.cache.write(caching_key, caching_value, caching_options)
  end

  def read
    Rails.cache.read(caching_key)
  end

  def fetch
    Rails.cache.fetch(caching_key, caching_options) { caching_value }
  end

  def delete
    Rails.cache.delete(caching_key)
  end

  protected

  def caching_options
    { expires_in: expires_in }
  end

  def raise_not_implemented_method(method_name)
    raise NoMethodError, "#{self.class} ##{method_name} method must be implemented in the subclass"
  end

  def expires_in
    1.month
  end

  private

  def caching_key
    "#{key_prefix}-#{key_sufix}"
  end

  protected

  def key_prefix
    "user_list"
  end

  def key_sufix
    'caching'
  end

  def caching_value
    User.all
  end
end
