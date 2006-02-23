

# REMINDER Add this to environment.rb during development
# Rails::Generator::Base.sources << Rails::Generator::PathSource.new(:development, "#{Dir.user_home}/dev/activesfdc/trunk/ActiveSalesforceGenerator/")


class AsfScaffoldGenerator < ScaffoldGenerator
  attr_accessor :record_type
  
  def initialize(runtime_args, runtime_options = {})
    super(runtime_args, runtime_options)
    
    #@record_type = args[2]
  end
  
  def manifest
    super
    
    record do |m|  
      # Scaffolded views.
      scaffold_views.each do |action|
        m.template "asf_view_#{action}.rhtml",
          File.join('app/views', controller_class_path, controller_file_name, "asf_#{action}.rhtml"),
        :assigns => { :action => action }
      end
      
      # Layout and stylesheet.
      m.template 'asf_layout.rhtml',  "app/views/layouts/asf_#{controller_file_name}.rhtml"
      m.template 'asf_scaffold.css',     'public/stylesheets/asf_scaffold.css'
      m.template 'asf_common.css',     'public/stylesheets/asf_common.css'
    end
  end  
  
  protected
  # Override with your own usage banner.
  def banner
      "Usage: #{$0} asf_scaffold ModelName RecordType [ControllerName] [action, ...]" 
  end
end
