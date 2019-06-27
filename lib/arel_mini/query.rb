module ArelMini
  class Query
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

    def select(args)
      fragment = Fragments::Select.new(args)
      root.add_fragment(fragment)
      self.class.new(root)
    end
  end
end
