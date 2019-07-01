module ArelMini
  class Query
    NODES_CLASSES = [Nodes::Select, Nodes::From, Nodes::Where, Nodes::Limit].freeze

    def to_sql
      ordered_ast = ast.sort_by { |node| NODES_CLASSES.index(node.class) }
      ordered_ast.map(&:to_sql_fragment).join(' ')
    end

    NODES_CLASSES.each do |klass|
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
