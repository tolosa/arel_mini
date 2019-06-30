module ArelMini::Nodes
  class Limit < Base
    def to_sql_fragment
      "LIMIT #{args.first}"
    end
  end
end
