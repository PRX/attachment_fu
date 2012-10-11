require 'tempfile'
require 'active_record'
require 'active_support/dependencies'

Tempfile.class_eval do
  # overwrite so tempfiles use the extension of the basename.  important for rmagick and image science
  def make_tmpname(basename, n)
    if(basename.is_a?(Array))    #for image_magick, it passes an array ex: ["mini_magick", ".jpeg"] 
      ext = basename[1]
      basename = basename[0]
    else
      ext = nil || ''          
    end
    sprintf('%s%d-%d%s', File::basename(basename, ext), $$, n.to_i, ext)
  end
end

require 'geometry'

require 'technoweenie/attachment_fu'

if RUBY_VERSION < '1.9'
  Tempfile.class_eval do
    # overwrite so tempfiles use the extension of the basename.  important for rmagick and image science
    def make_tmpname(basename, n)
      ext = nil
      sprintf("%s%d-%d%s", basename.to_s.gsub(/\.\w+$/) {  |s| ext = s; '' }, $$, n.to_i, ext)
    end
  end
end

ActiveSupport::Dependencies.autoload_paths << File.dirname(__FILE__)

ActiveRecord::Base.send(:extend, Technoweenie::AttachmentFu::ActMethods)
Technoweenie::AttachmentFu.tempfile_path = ATTACHMENT_FU_TEMPFILE_PATH if Object.const_defined?(:ATTACHMENT_FU_TEMPFILE_PATH)
FileUtils.mkdir_p Technoweenie::AttachmentFu.tempfile_path
