require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# Open the source code in $EDITOR
def source_for(object, method_sym)
  editor = ENV.fetch('EDITOR', 'vim')
  if object.respond_to?(method_sym, true)
    method = object.method(method_sym)
  elsif object.is_a?(Module)
    method = object.instance_method(method_sym)
  end
  location = method.source_location
  `subl #{location[0]}:#{location[1]}` if location
  location
rescue
  nil
end
