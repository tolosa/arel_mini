module ArelMini::Nodes
  class Select < Base
    def to_sql_fragment
      "SELECT #{args.join(', ')}"
    end
  end
end
