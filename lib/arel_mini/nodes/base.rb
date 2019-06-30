module ArelMini::Nodes
  class Base
    attr_reader :args

    def initialize(args)
      @args = args
    end

    def to_sql_fragment
      raise NotImplementedError
    end
  end
end
