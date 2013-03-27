module ApplicationHelper
  def custom_form_for(record_or_name_or_array, *args, &proc)
    options = args.extract_options!
    form_for(record_or_name_or_array, *(args << options.merge(:builder => CustomFormBuilder)), &proc)
    end
end
class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def label(method, text = nil, options = {}, &block)
    super
    #@template.label(@object_name, method, text, objectify_options(options), &block)
  end
end