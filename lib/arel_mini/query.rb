module ArelMini
  class Query
    FRAGMENT_CLASSES = [Fragments::Select, Fragments::From].freeze

    def to_sql
      ast.map(&:to_sql).join(' ')
    end

    FRAGMENT_CLASSES.each do |klass|
      # to get the class name without namespace, we can also use the string method `demodulize`
      # from ActiveSupport::Inflector, if available
      method_name = klass.name.split('::').last.downcase
      define_method(method_name) do |args|
        fragment = klass.new(args)
        add_fragment(fragment)
        self
      end
    end

    private

    def ast
      @ast ||= []
    end

    def add_fragment(fragment)
      ast << fragment
    end
  end
end
