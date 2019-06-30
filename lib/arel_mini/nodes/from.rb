module ArelMini::Nodes
  class From < Base
    def to_sql_fragment
      "FROM #{args.first}"
    end
  end
end
