module ArelMini
  class Query
    FRAGMENT_CLASSES = [Fragments::Select, Fragments::From].freeze

    attr_reader :fragments

    def initialize(root = nil)
      @root = root
      @fragments = []
    end

    def root
      @root || self
    end

    def to_sql
      root.fragments.map(&:to_sql).join(' ')
    end

    def add_fragment(fragment)
      fragments << fragment
    end

    FRAGMENT_CLASSES.each do |klass|
      # to get the class name without namespace, we can also use the string method `demodulize`
      # from ActiveSupport::Inflector, if available
      method_name = klass.name.split('::').last.downcase
      define_method(method_name) do |args|
        fragment = klass.new(args)
        root.add_fragment(fragment)
        self.class.new(root)
      end
    end
  end
end
