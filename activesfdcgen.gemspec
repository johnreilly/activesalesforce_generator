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

require 'rubygems'
SPEC = Gem::Specification.new do |s|
  s.name = "asf_scaffold_generator"
  s.version = "0.0.2"
  s.author = "Doug Chasman"
  s.email = "dchasman@salesforce.com"
  s.homepage = "http://rubyforge.org/projects/activesfdc/"
  s.platform = Gem::Platform::RUBY
  s.summary = "ActiveSalesforce Generator provides additional salesforce aware scaffolding support."

  candidates = Dir.glob("{.,asf_scaffold,templates,test}/**/*")
  s.files = candidates.delete_if do |item|
    item.include?(".svn") || item.include?("rdoc") || item.include?(".gem") || item.include?(".gemspec")
  end 
      
  s.has_rdoc = false
  s.extra_rdoc_files = ["USAGE"]
  s.add_dependency("rails", ">= 1.0.0")
  s.add_dependency("activesalesforce", ">= 0.2.6")
end
