module PageSteps

  def flash_message(type)
    find(".#{type}")
  end

  def main_table(&block)
    "table"
  end

  def table_rows
    all(:xpath, "//tbody/tr")
  end

end
