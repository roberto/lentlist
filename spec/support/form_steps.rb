module FormSteps
  extend RSpec::Matchers::DSL

  def form_title
    find("legend")
  end

  def main_form
    "fieldset"
  end

  matcher :have_input do |text|
    chain :with_placeholder do |placeholder|
      @placeholder = placeholder
    end

    match do |context|
      input = find_field(text)

      if @placeholder
        input && input[:placeholder] == @placeholder
      else
        input
      end
    end

    failure_message_for_should do |context|
      placeholder_message = "with placeholder #{@placeholder}"
      "expected #{context} to have input \"#{text}\" #{placeholder_message if @placeholder}"
    end

    failure_message_for_should_not do |context|
      placeholder_message = "with placeholder #{@placeholder}"
      "expected #{context} to not have input \"#{text}\" #{placeholder_message if @placeholder}"
    end
  end
end
