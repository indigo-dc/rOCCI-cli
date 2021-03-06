module Occi::Cli::Helpers::DescribeHelper

  def helper_describe(options, output = nil)
    if resource_types.include?(options.resource) || resource_type_identifiers.include?(options.resource) || options.resource.start_with?(options.endpoint) || options.resource.start_with?('/')
      Occi::Cli::Log.debug "#{options.resource.inspect} is a resource type, type identifier or an actual resource."

      resources_or_links = describe(options.resource)
      if resources_or_links.kind_of?(Occi::Core::Resources) || resources_or_links.kind_of?(Occi::Core::Links)
        found = resources_or_links
      else
        found = Occi::Core::Resources.new
      end
    elsif mixin_types.include?(options.resource) || mixin_type_identifiers.include?(options.resource)
      Occi::Cli::Log.debug "#{options.resource.inspect} is a mixin type or type identifier."

      found = mixins(options.resource)
      found = mixins(options.resource, true) if found.blank?
    elsif options.resource.include?('#')
      Occi::Cli::Log.debug "#{options.resource.inspect} might be a specific mixin identifier."

      potential_mixin = options.resource.split('/').last.split('#')
      raise "Given resource is not a specific mixin identifier! #{options.resource.inspect}" unless potential_mixin.size == 2

      mxn = mixin(potential_mixin[1], potential_mixin[0], true)
      raise "Given mixin could not be found in the model! #{options.resource.inspect}" if mxn.blank?

      found = Occi::Core::Mixins.new
      found << mxn
    else
      Occi::Cli::Log.error "I have no idea what #{options.resource.inspect} is ..."
      raise "Unknown resource #{options.resource.inspect}, there is nothing to describe here!"
    end

    helper_describe_output(found, options, output)
  end

  def helper_describe_output(found, options, output)
    return found unless output

    puts output.format(found)
  end

end