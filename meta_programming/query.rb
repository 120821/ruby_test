## todo
require 'active_support/all'
class Product
  # 不能这样写，注意需要独立写方法
  #include Searching::Query::ClassMethods
  #def sort
  #end

end

module Searching
  module Query
    def self.define model, &block
      klass = model.to_s.contantize
      klass.instance_eval(&block)
      klass.extend ClassMethods
    end
    module ClassMethods
      def search
      end
    end
  end
end

#Product.search
Searching::Query.define :Product do
  def sort
  end
  def search
    # code
  end
end
