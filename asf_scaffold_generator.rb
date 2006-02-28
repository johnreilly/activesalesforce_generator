=begin
  ActiveSalesforce
  Copyright (c) 2006 Doug Chasman

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
=end


# REMINDER Add this to environment.rb during development
# Rails::Generator::Base.sources << Rails::Generator::PathSource.new(:development, "#{Dir.user_home}/dev/activesfdc/trunk/ActiveSalesforceGenerator/")


class AsfScaffoldGenerator < ScaffoldGenerator
  attr_accessor :record_type
  
  def initialize(runtime_args, runtime_options = {})
    super(runtime_args, runtime_options)
    
    #@record_type = args[2]
  end
  
  def manifest
    record do |m|  
      # Scaffolded views.
      scaffold_views.each do |action|
        m.template "asf_view_#{action}.rhtml",
          File.join('app/views', controller_class_path, controller_file_name, "#{action}.rhtml"),
        :assigns => { :action => action }
      end
      
      # Layout and stylesheet.
      m.template 'asf_layout.rhtml', "app/views/layouts/#{controller_file_name}.rhtml"
    end
  end  
  

  protected
  
    # DCHASMAN TODO Remove this when the show, new and edit templates are ready
    def scaffold_views
      #%w(list show new edit)
      %w(list show)
    end  
  
    # Override with your own usage banner.
    def banner
        "Usage: #{$0} asf_scaffold ModelName RecordType [ControllerName] [action, ...]" 
    end
end
