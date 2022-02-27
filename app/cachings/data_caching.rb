module Cachings
  class DataCaching
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

    def key_prefix
       raise_not_implemented_method('key_prefix')
    end

    def key_sufix
      raise_not_implemented_method('key_sufix')
    end

    def caching_value
      raise_not_implemented_method('caching_value')
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
  end
end
