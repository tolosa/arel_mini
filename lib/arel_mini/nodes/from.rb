module ArelMini::Nodes
  class From < Base
    def to_sql_fragment
      "FROM #{args}"
    end
  end
end
