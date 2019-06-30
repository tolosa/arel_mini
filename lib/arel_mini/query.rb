module ArelMini
  class Query
    NODES_CLASSES = [Nodes::Select, Nodes::From, Nodes::Where, Nodes::Limit].freeze

    def to_sql
      ast.map(&:to_sql_fragment).join(' ')
    end

    NODES_CLASSES.each do |klass|
      # to get the class name without namespace, we can also use the
      # string method `demodulize`from ActiveSupport::Inflector, if available
      method_name = klass.name.split('::').last.downcase
      define_method(method_name) do |*args|
        node = klass.new(*args)
        add_node(node)
        self
      end
    end

    private

    def ast
      @ast ||= []
    end

    def add_node(node)
      ast << node
    end
  end
end
