=begin
 This is a machine generated stub using stdlib-doc for <b>class NotImplementedError</b>
 Sources used:  Ruby 1.9.2-p320
 Created on 2013-07-25 12:24:14 +0400 by IntelliJ Ruby Stubs Generator.
=end

# Raised when a feature is not implemented on the current platform. For
# example, methods depending on the +fsync+ or +fork+ system calls may
# raise this exception if the underlying operating system or Ruby
# runtime does not support them.
# 
# Note that if +fork+ raises a +NotImplementedError+, then
# <code>respond_to?(:fork)</code> returns +false+.
class NotImplementedError < ScriptError
end
