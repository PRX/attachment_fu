lib = File.expand_path('../lib/', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name         = 'attachment_fu'
  s.version      = '0.0.4'
  s.platform     = Gem::Platform::RUBY
  s.authors      = ['Jon Moses']
  s.email        = ['jon@burningbush.us']
  s.homepage     = 'https://github.com/jmoses/attachment_ru'
  s.summary      = 'Attachment-fu for rails3'
  s.description  = 'attachment-fu for rails3.  You know what it is.'
  
  s.files        = Dir.glob("{lib,rails,vendor}/**/*") + %w( CHANGELOG LICENSE README amazon_s3.yml.tpl rackspace_cloudfiles.yml.tpl )
  s.require_path = 'lib'
end
