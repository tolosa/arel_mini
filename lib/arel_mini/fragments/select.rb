module ArelMini::Fragments
  class Select
    attr_reader :args

    def initialize(args)
      @args = args
    end

    def to_sql
      "SELECT #{args}"
    end
  end
end
