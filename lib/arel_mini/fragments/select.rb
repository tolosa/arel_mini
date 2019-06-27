module ArelMini::Fragments
  class Select < Base
    def to_sql
      "SELECT #{args}"
    end
  end
end
