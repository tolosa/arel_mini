module ArelMini::Nodes
  class From < Base
    def to_sql
      "FROM #{args}"
    end
  end
end
