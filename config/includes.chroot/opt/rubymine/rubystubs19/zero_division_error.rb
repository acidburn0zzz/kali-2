=begin
 This is a machine generated stub using stdlib-doc for <b>class ZeroDivisionError</b>
 Sources used:  Ruby 1.9.2-p320
 Created on 2013-07-25 12:24:14 +0400 by IntelliJ Ruby Stubs Generator.
=end

# Raised when attempting to divide an integer by 0.
# 
#    42 / 0
# 
# <em>raises the exception:</em>
# 
#    ZeroDivisionError: divided by 0
# 
# Note that only division by an exact 0 will raise that exception:
# 
#    42 /  0.0 #=> Float::INFINITY
#    42 / -0.0 #=> -Float::INFINITY
#    0  /  0.0 #=> NaN
class ZeroDivisionError < StandardError
end
