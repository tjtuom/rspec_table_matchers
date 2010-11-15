module RSpecTableMatchers
  class TableColumnMatcher
    def initialize(title, values)
      @title = title
      @values = values
    end

    def title_selector
      "th[contains(., '#{@title}')]"
    end

    def row_selector(index)
      ".//#{title_selector}/following::tr[#{index}]/td[count(ancestor::table//#{title_selector}/preceding-sibling::th) + 1]"
    end

    def matches?(page)
      @page = page
      ret = true
      @values.each_with_index do |value, index|
        index += 1
        ret = ret && page.has_xpath?(row_selector(index), :text => value)
      end
      ret
    end

    def failure_message_for_should
      if @page.has_xpath?(".//#{title_selector}")
        actual_values = (1..@values.size).map { |i| @page.find(:xpath, row_selector(i)) }.compact.map(&:text)
        "expected page to have table column #{@title} with values #{values_to_s(@values)} but found values #{values_to_s(actual_values)}"
      else
        "expected to find table column with title '#{@title}' but did not"
      end
    end

    def values_to_s(values)
      values.map { |v| "'#{v}'" }.join(', ')
    end
  end

  def have_table_column(title, *values)
    TableColumnMatcher.new(title, values)
  end
end
