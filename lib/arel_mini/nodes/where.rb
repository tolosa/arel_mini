module ArelMini::Nodes
  class Where < Base
    def to_sql_fragment
      condition = args.first
      condition = condition.map { |name, value| "#{name} = '#{value}'" }.join ' AND ' \
        if condition.is_a? Hash
      "WHERE #{condition}"
    end
  end
end
