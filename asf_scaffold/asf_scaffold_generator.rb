#require 'scaffold_generator'
require_gem 'rails'
require 'NamedBase'


# REMINDER
# Rails::Generator::Base.sources << Rails::Generator::PathSource.new(:development, "#{Dir.user_home}/dev/activesfdc/trunk/ActiveSalesforceGenerator/")


class AsfScaffoldGenerator < Rails::Generator::NamedBase #ScaffoldGenerator
  attr_accessor :record_type
  
  def initialize(runtime_args, runtime_options = {})
    super(runtime_args, runtime_options)
    
    pp self
    
    #@record_type = args[2]
  end
  
  def manifest
    pp self 
    super
    
    record do |m|  
      # Scaffolded views.
      scaffold_views.each do |action|
        m.template "asf_view_#{action}.rhtml",
        File.join('app/views',
        controller_class_path,
        controller_file_name,
                             "asf_#{action}.rhtml"),
        :assigns => { :action => action }
      end
    end
  end  
  
  protected
  # Override with your own usage banner.
  def banner
      "Usage: #{$0} asf_scaffold ModelName RecordType [ControllerName] [action, ...]" 
  end
end
