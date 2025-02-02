=begin
 This is a machine generated stub using stdlib-doc for <b>class Date</b>
 Sources used:  Ruby 2.0.0-p247
 Created on 2013-07-25 12:30:22 +0400 by IntelliJ Ruby Stubs Generator.
=end

# date and datetime class - Tadayoshi Funaba 1998-2011
# 
# 'date' provides two classes Date and DateTime.
# 
# == Terms and definitions
# 
# Some terms and definitions are based on ISO 8601 and JIS X 0301.
# 
# === calendar date
# 
# The calendar date is a particular day of a calendar year,
# identified by its ordinal number within a calendar month within
# that year.
# 
# In those classes, this is so-called "civil".
# 
# === ordinal date
# 
# The ordinal date is a particular day of a calendar year identified
# by its ordinal number within the year.
# 
# In those classes, this is so-called "ordinal".
# 
# === week date
# 
# The week date is a date identified by calendar week and day numbers.
# 
# The calendar week is a seven day period within a calendar year,
# starting on a Monday and identified by its ordinal number within
# the year; the first calendar week of the year is the one that
# includes the first Thursday of that year.  In the Gregorian
# calendar, this is equivalent to the week which includes January 4.
# 
# In those classes, this so-called "commercial".
# 
# === julian day number
# 
# The Julian day number is in elapsed days since noon (Greenwich mean
# time) on January 1, 4713 BCE (in the Julian calendar).
# 
# In this document, the astronomical Julian day number is same as the
# original Julian day number.  And the chronological Julian day
# number is a variation of the Julian day number.  Its days begin at
# midnight on local time.
# 
# In this document, when the term "Julian day number" simply appears,
# it just refers to "chronological Julian day number", not the
# original.
# 
# In those classes, those are so-called "ajd" and "jd".
# 
# === modified julian day number
# 
# The modified Julian day number is in elapsed days since midnight
# (Coordinated universal time) on November 17, 1858 CE (in the
# Gregorian calendar).
# 
# In this document, the astronomical modified Julian day number is
# same as the original modified Julian day number.  And the
# chronological modified Julian day number is a variation of the
# modified Julian day number.  Its days begin at midnight on local
# time.
# 
# In this document, when the term "modified Julian day number" simply
# appears, it just refers to "chronological modified Julian day
# number", not the original.
# 
# In those classes, this is so-called "mjd".
# 
# == Date
# 
# A subclass of Object includes Comparable module, easily handles
# date.
# 
# Date object is created with Date::new, Date::jd, Date::ordinal,
# Date::commercial, Date::parse, Date::strptime, Date::today,
# Time#to_date or etc.
# 
#     require 'date'
# 
#     Date.new(2001,2,3)           #=> #<Date: 2001-02-03 ...>
#     Date.jd(2451944)             #=> #<Date: 2001-02-03 ...>
#     Date.ordinal(2001,34)        #=> #<Date: 2001-02-03 ...>
#     Date.commercial(2001,5,6)    #=> #<Date: 2001-02-03 ...>
#     Date.parse('2001-02-03')     #=> #<Date: 2001-02-03 ...>
#     Date.strptime('03-02-2001', '%d-%m-%Y')
#                                  #=> #<Date: 2001-02-03 ...>
#     Time.new(2001,2,3).to_date   #=> #<Date: 2001-02-03 ...>
# 
# All date objects are immutable; hence cannot modify themselves.
# 
# The concept of this date object can be represented as a tuple
# of the day count, the offset and the day of calendar reform.
# 
# The day count denotes the absolute position of a temporal
# dimension.  The offset is relative adjustment, which determines
# decoded local time with the day count.  The day of calendar
# reform denotes the start day of the new style.  The old style
# of the West is the Julian calendar which was adopted by
# Caersar.  The new style is the Gregorian calendar, which is the
# current civil calendar of many countries.
# 
# The day count is virtually the astronomical Julian day number.
# The offset in this class is usually zero, and cannot be
# specified directly.
# 
# An optional argument the day of calendar reform (start) as a
# Julian day number, which should be 2298874 to 2426355 or -/+oo.
# The default value is Date::ITALY (2299161=1582-10-15).  See
# also sample/cal.rb.
# 
#     $ ruby sample/cal.rb -c it 10 1582
#         October 1582
#      S  M Tu  W Th  F  S
#         1  2  3  4 15 16
#     17 18 19 20 21 22 23
#     24 25 26 27 28 29 30
#     31
# 
#     $ ruby sample/cal.rb -c gb  9 1752
#        September 1752
#      S  M Tu  W Th  F  S
#            1  2 14 15 16
#     17 18 19 20 21 22 23
#     24 25 26 27 28 29 30
# 
# Date object has various methods. See each reference.
# 
#     d = Date.parse('3rd Feb 2001')
#                                  #=> #<Date: 2001-02-03 ...>
#     d.year                       #=> 2001
#     d.mon                        #=> 2
#     d.mday                       #=> 3
#     d.wday                       #=> 6
#     d += 1                       #=> #<Date: 2001-02-04 ...>
#     d.strftime('%a %d %b %Y')    #=> "Sun 04 Feb 2001"
# 
# == DateTime
# 
# A subclass of Date easily handles date, hour, minute, second and
# offset.
# 
# DateTime does not consider any leapseconds, does not track
# any summer time rules.
# 
# DateTime object is created with DateTime::new, DateTime::jd,
# DateTime::ordinal, DateTime::commercial, DateTime::parse,
# DateTime::strptime, DateTime::now, Time#to_datetime or etc.
# 
#     require 'date'
# 
#     DateTime.new(2001,2,3,4,5,6)
#                          #=> #<DateTime: 2001-02-03T04:05:06+00:00 ...>
# 
# The last element of day, hour, minute or senond can be
# fractional number. The fractional number's precision is assumed
# at most nanosecond.
# 
#     DateTime.new(2001,2,3.5)
#                          #=> #<DateTime: 2001-02-03T12:00:00+00:00 ...>
# 
# An optional argument the offset indicates the difference
# between the local time and UTC.  For example, Rational(3,24)
# represents ahead of 3 hours of UTC, Rational(-5,24) represents
# behind of 5 hours of UTC.  The offset should be -1 to +1, and
# its precision is assumed at most second.  The default value is
# zero (equals to UTC).
# 
#     DateTime.new(2001,2,3,4,5,6,Rational(3,24))
#                          #=> #<DateTime: 2001-02-03T04:05:06+03:00 ...>
# also accepts string form.
# 
#     DateTime.new(2001,2,3,4,5,6,'+03:00')
#                          #=> #<DateTime: 2001-02-03T04:05:06+03:00 ...>
# 
# An optional argument the day of calendar reform (start) denotes
# a Julian day number, which should be 2298874 to 2426355 or
# -/+oo.  The default value is Date::ITALY (2299161=1582-10-15).
# 
# DateTime object has various methods. See each reference.
# 
#     d = DateTime.parse('3rd Feb 2001 04:05:06+03:30')
#                          #=> #<DateTime: 2001-02-03T04:05:06+03:30 ...>
#     d.hour               #=> 4
#     d.min                #=> 5
#     d.sec                #=> 6
#     d.offset             #=> (7/48)
#     d.zone               #=> "+03:30"
#     d += Rational('1.5')
#                          #=> #<DateTime: 2001-02-04%16:05:06+03:30 ...>
#     d = d.new_offset('+09:00')
#                          #=> #<DateTime: 2001-02-04%21:35:06+09:00 ...>
#     d.strftime('%I:%M:%S %p')
#                          #=> "09:35:06 PM"
#     d > DateTime.new(1999)
#                          #=> true
class Date
    include Comparable
    # An array of stirng of full month name in English.  The first
    # element is nil.
    MONTHNAMES = nil #value is unknown, used for indexing.
    # An array of string of abbreviated month name in English.  The
    # first element is nil.
    ABBR_MONTHNAMES = nil #value is unknown, used for indexing.
    # An array of string of full name of days of the week in English.
    # The first is "Sunday".
    DAYNAMES = nil #value is unknown, used for indexing.
    # An array of string of abbreviated day name in English.  The
    # first is "Sun".
    ABBR_DAYNAMES = nil #value is unknown, used for indexing.
    # The Julian day number of the day of calendar reform for Italy
    # and some catholic countries.
    ITALY = nil #value is unknown, used for indexing.
    # The Julian day number of the day of calendar reform for England
    # and her colonies.
    ENGLAND = nil #value is unknown, used for indexing.
    # The Julian day number of the day of calendar reform for the
    # proleptic Julian calendar
    JULIAN = nil #value is unknown, used for indexing.
    # The Julian day number of the day of calendar reform for the
    # proleptic Gregorian calendar
    GREGORIAN = nil #value is unknown, used for indexing.
    # Date.valid_jd?(jd[, start=Date::ITALY])  ->  bool
    #  
    # Just returns true.  It's nonsense, but is for symmetry.
    # 
    #    Date.valid_jd?(2451944)           #=> true
    # 
    # See also jd.
    def self.valid_jd?(p1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date.valid_ordinal?(year, yday[, start=Date::ITALY])  ->  bool
    #  
    # Returns true if the given ordinal date is valid, and false if not.
    # 
    #    Date.valid_ordinal?(2001,34)      #=> true
    #    Date.valid_ordinal?(2001,366)     #=> false
    # 
    # See also jd and ordinal.
    def self.valid_ordinal?(p1, p2, p3 = v3)
        #This is a stub, used for indexing
    end
    # Date.valid_civil?(year, month, mday[, start=Date::ITALY])  ->  bool
    # Date.valid_date?(year, month, mday[, start=Date::ITALY])   ->  bool
    #  
    # Returns true if the given calendar date is valid, and false if not.
    # 
    #    Date.valid_date?(2001,2,3)        #=> true
    #    Date.valid_date?(2001,2,29)       #=> false
    # 
    # See also jd and civil.
    def self.valid_civil?(p1, p2, p3, p4 = v4)
        #This is a stub, used for indexing
    end
    # Date.valid_civil?(year, month, mday[, start=Date::ITALY])  ->  bool
    # Date.valid_date?(year, month, mday[, start=Date::ITALY])   ->  bool
    #  
    # Returns true if the given calendar date is valid, and false if not.
    # 
    #    Date.valid_date?(2001,2,3)        #=> true
    #    Date.valid_date?(2001,2,29)       #=> false
    # 
    # See also jd and civil.
    def self.valid_date?(p1, p2, p3, p4 = v4)
        #This is a stub, used for indexing
    end
    # Date.valid_commercial?(cwyear, cweek, cwday[, start=Date::ITALY])  ->  bool
    #  
    # Returns true if the given week date is valid, and false if not.
    # 
    #    Date.valid_commercial?(2001,5,6)  #=> true
    #    Date.valid_commercial?(2001,5,8)  #=> false
    # 
    # See also jd and commercial.
    def self.valid_commercial?(p1, p2, p3, p4 = v4)
        #This is a stub, used for indexing
    end
    # Date.julian_leap?(year)  ->  bool
    #  
    # Returns true if the given year is a leap year of the proleptic
    # Julian calendar.
    # 
    #    Date.julian_leap?(1900)           #=> true
    #    Date.julian_leap?(1901)           #=> false
    def self.julian_leap?(year)
        #This is a stub, used for indexing
    end
    # Date.gregorian_leap?(year)  ->  bool
    # Date.leap?(year)            ->  bool
    #  
    # Returns true if the given year is a leap year of the proleptic
    # Gregorian calendar.
    # 
    #    Date.gregorian_leap?(1900)        #=> false
    #    Date.gregorian_leap?(2000)        #=> true
    def self.gregorian_leap?(year)
        #This is a stub, used for indexing
    end
    # Date.gregorian_leap?(year)  ->  bool
    # Date.leap?(year)            ->  bool
    #  
    # Returns true if the given year is a leap year of the proleptic
    # Gregorian calendar.
    # 
    #    Date.gregorian_leap?(1900)        #=> false
    #    Date.gregorian_leap?(2000)        #=> true
    def self.leap?(year)
        #This is a stub, used for indexing
    end
    # Date.jd([jd=0[, start=Date::ITALY]])  ->  date
    #  
    # Creates a date object denoting the given chronological Julian day
    # number.
    # 
    #    Date.jd(2451944)          #=> #<Date: 2001-02-03 ...>
    #    Date.jd(2451945)          #=> #<Date: 2001-02-04 ...>
    #    Date.jd(0)                #=> #<Date: -4712-01-01 ...>
    # 
    # See also new.
    def self.jd(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date.ordinal([year=-4712[, yday=1[, start=Date::ITALY]]])  ->  date
    #  
    # Creates a date object denoting the given ordinal date.
    # 
    # The day of year should be a negative or a positive number (as a
    # relative day from the end of year when negative).  It should not be
    # zero.
    # 
    #    Date.ordinal(2001)        #=> #<Date: 2001-01-01 ...>
    #    Date.ordinal(2001,34)     #=> #<Date: 2001-02-03 ...>
    #    Date.ordinal(2001,-1)     #=> #<Date: 2001-12-31 ...>
    # 
    # See also jd and new.
    def self.ordinal(p1 = v1, p2 = v2, p3 = v3)
        #This is a stub, used for indexing
    end
    # Date.civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]])  ->  date
    # Date.new([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]])    ->  date
    #  
    # Creates a date object denoting the given calendar date.
    # 
    # In this class, BCE years are counted astronomically.  Thus, the
    # year before the year 1 is the year zero, and the year preceding the
    # year zero is the year -1.  The month and the day of month should be
    # a negative or a positive number (as a relative month/day from the
    # end of year/month when negative).  They should not be zero.
    # 
    # The last argument should be a Julian day number which denotes the
    # day of calendar reform.  Date::ITALY (2299161=1582-10-15),
    # Date::ENGLAND (2361222=1752-09-14), Date::GREGORIAN (the proleptic
    # Gregorian calendar) and Date::JULIAN (the proleptic Julian
    # calendar) can be specified as a day of calendar reform.
    # 
    #    Date.new(2001)            #=> #<Date: 2001-01-01 ...>
    #    Date.new(2001,2,3)        #=> #<Date: 2001-02-03 ...>
    #    Date.new(2001,2,-1)       #=> #<Date: 2001-02-28 ...>
    # 
    # See also jd.
    def self.civil(p1 = v1, p2 = v2, p3 = v3, p4 = v4)
        #This is a stub, used for indexing
    end
    # Date.civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]])  ->  date
    # Date.new([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]])    ->  date
    #  
    # Creates a date object denoting the given calendar date.
    # 
    # In this class, BCE years are counted astronomically.  Thus, the
    # year before the year 1 is the year zero, and the year preceding the
    # year zero is the year -1.  The month and the day of month should be
    # a negative or a positive number (as a relative month/day from the
    # end of year/month when negative).  They should not be zero.
    # 
    # The last argument should be a Julian day number which denotes the
    # day of calendar reform.  Date::ITALY (2299161=1582-10-15),
    # Date::ENGLAND (2361222=1752-09-14), Date::GREGORIAN (the proleptic
    # Gregorian calendar) and Date::JULIAN (the proleptic Julian
    # calendar) can be specified as a day of calendar reform.
    # 
    #    Date.new(2001)            #=> #<Date: 2001-01-01 ...>
    #    Date.new(2001,2,3)        #=> #<Date: 2001-02-03 ...>
    #    Date.new(2001,2,-1)       #=> #<Date: 2001-02-28 ...>
    # 
    # See also jd.
    def self.new(p1 = v1, p2 = v2, p3 = v3, p4 = v4)
        #This is a stub, used for indexing
    end
    # Date.commercial([cwyear=-4712[, cweek=1[, cwday=1[, start=Date::ITALY]]]])  ->  date
    #  
    # Creates a date object denoting the given week date.
    # 
    # The week and the day of week should be a negative or a positive
    # number (as a relative week/day from the end of year/week when
    # negative).  They should not be zero.
    # 
    #    Date.commercial(2001)     #=> #<Date: 2001-01-01 ...>
    #    Date.commercial(2002)     #=> #<Date: 2001-12-31 ...>
    #    Date.commercial(2001,5,6) #=> #<Date: 2001-02-03 ...>
    # 
    # See also jd and new.
    def self.commercial(p1 = v1, p2 = v2, p3 = v3, p4 = v4)
        #This is a stub, used for indexing
    end
    # Date.today([start=Date::ITALY])  ->  date
    # 
    # Date.today                #=> #<Date: 2011-06-11 ..>
    #  
    # Creates a date object denoting the present day.
    def self.today(*several_variants)
        #This is a stub, used for indexing
    end
    # Date._strptime(string[, format='%F'])  ->  hash
    #  
    # Parses the given representation of date and time with the given
    # template, and returns a hash of parsed elements.  _strptime does
    # not support specification of flags and width unlike strftime.
    # 
    #    Date._strptime('2001-02-03', '%Y-%m-%d')
    #                              #=> {:year=>2001, :mon=>2, :mday=>3}
    # 
    #  See also strptime(3) and strftime.
    def self._strptime(*args)
        #This is a stub, used for indexing
    end
    # Date.strptime([string='-4712-01-01'[, format='%F'[, start=ITALY]]])  ->  date
    #  
    # Parses the given representation of date and time with the given
    # template, and creates a date object.  strptime does not support
    # specification of flags and width unlike strftime.
    # 
    #    Date.strptime('2001-02-03', '%Y-%m-%d')   #=> #<Date: 2001-02-03 ...>
    #    Date.strptime('03-02-2001', '%d-%m-%Y')   #=> #<Date: 2001-02-03 ...>
    #    Date.strptime('2001-034', '%Y-%j')        #=> #<Date: 2001-02-03 ...>
    #    Date.strptime('2001-W05-6', '%G-W%V-%u')  #=> #<Date: 2001-02-03 ...>
    #    Date.strptime('2001 04 6', '%Y %U %w')    #=> #<Date: 2001-02-03 ...>
    #    Date.strptime('2001 05 6', '%Y %W %u')    #=> #<Date: 2001-02-03 ...>
    #    Date.strptime('sat3feb01', '%a%d%b%y')    #=> #<Date: 2001-02-03 ...>
    # 
    # See also strptime(3) and strftime.
    def self.strptime(p1 = v1, p2 = v2, p3 = v3)
        #This is a stub, used for indexing
    end
    # Date._parse(string[, comp=true])  ->  hash
    #  
    # Parses the given representation of date and time, and returns a
    # hash of parsed elements.  This method does not function as a
    # validator.
    # 
    # If the optional second argument is true and the detected year is in
    # the range "00" to "99", considers the year a 2-digit form and makes
    # it full.
    # 
    #    Date._parse('2001-02-03') #=> {:year=>2001, :mon=>2, :mday=>3}
    def self._parse(*args)
        #This is a stub, used for indexing
    end
    # Date.parse(string='-4712-01-01'[, comp=true[, start=ITALY]])  ->  date
    #  
    # Parses the given representation of date and time, and creates a
    # date object.  This method does not function as a validator.
    # 
    # If the optional second argument is true and the detected year is in
    # the range "00" to "99", considers the year a 2-digit form and makes
    # it full.
    # 
    #    Date.parse('2001-02-03')          #=> #<Date: 2001-02-03 ...>
    #    Date.parse('20010203')            #=> #<Date: 2001-02-03 ...>
    #    Date.parse('3rd Feb 2001')        #=> #<Date: 2001-02-03 ...>
    def self.parse(p1 = v1, p2 = v2, p3 = v3)
        #This is a stub, used for indexing
    end
    # Date._iso8601(string)  ->  hash
    #  
    # Returns a hash of parsed elements.
    def self._iso8601(string)
        #This is a stub, used for indexing
    end
    # Date.iso8601(string='-4712-01-01'[, start=ITALY])  ->  date
    #  
    # Creates a new Date object by parsing from a string according to
    # some typical ISO 8601 formats.
    # 
    #    Date.iso8601('2001-02-03')        #=> #<Date: 2001-02-03 ...>
    #    Date.iso8601('20010203')          #=> #<Date: 2001-02-03 ...>
    #    Date.iso8601('2001-W05-6')        #=> #<Date: 2001-02-03 ...>
    def self.iso8601(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date._rfc3339(string)  ->  hash
    #  
    # Returns a hash of parsed elements.
    def self._rfc3339(string)
        #This is a stub, used for indexing
    end
    # Date.rfc3339(string='-4712-01-01T00:00:00+00:00'[, start=ITALY])  ->  date
    #  
    # Creates a new Date object by parsing from a string according to
    # some typical RFC 3339 formats.
    # 
    #    Date.rfc3339('2001-02-03T04:05:06+07:00') #=> #<Date: 2001-02-03 ...>
    def self.rfc3339(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date._xmlschema(string)  ->  hash
    #  
    # Returns a hash of parsed elements.
    def self._xmlschema(string)
        #This is a stub, used for indexing
    end
    # Date.xmlschema(string='-4712-01-01'[, start=ITALY])  ->  date
    #  
    # Creates a new Date object by parsing from a string according to
    # some typical XML Schema formats.
    # 
    #    Date.xmlschema('2001-02-03')      #=> #<Date: 2001-02-03 ...>
    def self.xmlschema(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date._rfc2822(string)  ->  hash
    # Date._rfc822(string)   ->  hash
    #  
    # Returns a hash of parsed elements.
    def self._rfc2822(string)
        #This is a stub, used for indexing
    end
    # Date._rfc2822(string)  ->  hash
    # Date._rfc822(string)   ->  hash
    #  
    # Returns a hash of parsed elements.
    def self._rfc822(string)
        #This is a stub, used for indexing
    end
    # Date.rfc2822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])  ->  date
    # Date.rfc822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])   ->  date
    #  
    # Creates a new Date object by parsing from a string according to
    # some typical RFC 2822 formats.
    # 
    #    Date.rfc2822('Sat, 3 Feb 2001 00:00:00 +0000')
    #                                              #=> #<Date: 2001-02-03 ...>
    def self.rfc2822(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date.rfc2822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])  ->  date
    # Date.rfc822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=ITALY])   ->  date
    #  
    # Creates a new Date object by parsing from a string according to
    # some typical RFC 2822 formats.
    # 
    #    Date.rfc2822('Sat, 3 Feb 2001 00:00:00 +0000')
    #                                              #=> #<Date: 2001-02-03 ...>
    def self.rfc822(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date._httpdate(string)  ->  hash
    #  
    # Returns a hash of parsed elements.
    def self._httpdate(string)
        #This is a stub, used for indexing
    end
    # Date.httpdate(string='Mon, 01 Jan -4712 00:00:00 GMT'[, start=ITALY])  ->  date
    #  
    # Creates a new Date object by parsing from a string according to
    # some RFC 2616 format.
    # 
    #    Date.httpdate('Sat, 03 Feb 2001 00:00:00 GMT')
    #                                              #=> #<Date: 2001-02-03 ...>
    def self.httpdate(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # Date._jisx0301(string)  ->  hash
    #  
    # Returns a hash of parsed elements.
    def self._jisx0301(string)
        #This is a stub, used for indexing
    end
    # Date.jisx0301(string='-4712-01-01'[, start=ITALY])  ->  date
    #  
    # Creates a new Date object by parsing from a string according to
    # some typical JIS X 0301 formats.
    # 
    #    Date.jisx0301('H13.02.03')                #=> #<Date: 2001-02-03 ...>
    def self.jisx0301(p1 = v1, p2 = v2)
        #This is a stub, used for indexing
    end
    # d.ajd  ->  rational
    #  
    # Returns the astronomical Julian day number.  This is a fractional
    # number, which is not adjusted by the offset.
    # 
    #    DateTime.new(2001,2,3,4,5,6,'+7').ajd     #=> (11769328217/4800)
    #    DateTime.new(2001,2,2,14,5,6,'-7').ajd    #=> (11769328217/4800)
    def ajd()
        #This is a stub, used for indexing
    end
    # d.amjd  ->  rational
    #  
    # Returns the astronomical modified Julian day number.  This is
    # a fractional number, which is not adjusted by the offset.
    # 
    #    DateTime.new(2001,2,3,4,5,6,'+7').amjd    #=> (249325817/4800)
    #    DateTime.new(2001,2,2,14,5,6,'-7').amjd   #=> (249325817/4800)
    def amjd()
        #This is a stub, used for indexing
    end
    # d.jd  ->  integer
    #  
    # Returns the Julian day number.  This is a whole number, which is
    # adjusted by the offset as the local time.
    # 
    #    DateTime.new(2001,2,3,4,5,6,'+7').jd      #=> 2451944
    #    DateTime.new(2001,2,3,4,5,6,'-7').jd      #=> 2451944
    def jd()
        #This is a stub, used for indexing
    end
    # d.mjd  ->  integer
    #  
    # Returns the modified Julian day number.  This is a whole number,
    # which is adjusted by the offset as the local time.
    # 
    #    DateTime.new(2001,2,3,4,5,6,'+7').mjd     #=> 51943
    #    DateTime.new(2001,2,3,4,5,6,'-7').mjd     #=> 51943
    def mjd()
        #This is a stub, used for indexing
    end
    # d.ld  ->  integer
    #  
    # Returns the Lilian day number.  This is a whole number, which is
    # adjusted by the offset as the local time.
    # 
    #     Date.new(2001,2,3).ld            #=> 152784
    def ld()
        #This is a stub, used for indexing
    end
    # d.year  ->  integer
    #  
    # Returns the year.
    # 
    #    Date.new(2001,2,3).year           #=> 2001
    #    (Date.new(1,1,1) - 1).year        #=> 0
    def year()
        #This is a stub, used for indexing
    end
    # d.yday  ->  fixnum
    #  
    # Returns the day of the year (1-366).
    # 
    #    Date.new(2001,2,3).yday           #=> 34
    def yday()
        #This is a stub, used for indexing
    end
    # d.mon    ->  fixnum
    # d.month  ->  fixnum
    #  
    # Returns the month (1-12).
    # 
    #    Date.new(2001,2,3).mon            #=> 2
    def mon(*several_variants)
        #This is a stub, used for indexing
    end
    # d.mon    ->  fixnum
    # d.month  ->  fixnum
    #  
    # Returns the month (1-12).
    # 
    #    Date.new(2001,2,3).mon            #=> 2
    def month()
        #This is a stub, used for indexing
    end
    # d.mday  ->  fixnum
    # d.day   ->  fixnum
    #  
    # Returns the day of the month (1-31).
    # 
    #    Date.new(2001,2,3).mday           #=> 3
    def mday()
        #This is a stub, used for indexing
    end
    # d.mday  ->  fixnum
    # d.day   ->  fixnum
    #  
    # Returns the day of the month (1-31).
    # 
    #    Date.new(2001,2,3).mday           #=> 3
    def day()
        #This is a stub, used for indexing
    end
    # d.day_fraction  ->  rational
    #  
    # Returns the fractional part of the day.
    # 
    #    DateTime.new(2001,2,3,12).day_fraction    #=> (1/2)
    def day_fraction()
        #This is a stub, used for indexing
    end
    # d.cwyear  ->  integer
    #  
    # Returns the calendar week based year.
    # 
    #    Date.new(2001,2,3).cwyear         #=> 2001
    #    Date.new(2000,1,1).cwyear         #=> 1999
    def cwyear()
        #This is a stub, used for indexing
    end
    # d.cweek  ->  fixnum
    #  
    # Returns the calendar week number (1-53).
    # 
    #    Date.new(2001,2,3).cweek          #=> 5
    def cweek()
        #This is a stub, used for indexing
    end
    # d.cwday  ->  fixnum
    #  
    # Returns the day of calendar week (1-7, Monday is 1).
    # 
    #    Date.new(2001,2,3).cwday          #=> 6
    def cwday()
        #This is a stub, used for indexing
    end
    # d.wday  ->  fixnum
    #  
    # Returns the day of week (0-6, Sunday is zero).
    # 
    #    Date.new(2001,2,3).wday           #=> 6
    def wday()
        #This is a stub, used for indexing
    end
    # d.sunday?  ->  bool
    #  
    # Returns true if the date is Sunday.
    def sunday?()
        #This is a stub, used for indexing
    end
    # d.monday?  ->  bool
    #  
    # Returns true if the date is Monday.
    def monday?()
        #This is a stub, used for indexing
    end
    # d.tuesday?  ->  bool
    #  
    # Returns true if the date is Tuesday.
    def tuesday?()
        #This is a stub, used for indexing
    end
    # d.wednesday?  ->  bool
    #  
    # Returns true if the date is Wednesday.
    def wednesday?()
        #This is a stub, used for indexing
    end
    # d.thursday?  ->  bool
    #  
    # Returns true if the date is Thursday.
    def thursday?()
        #This is a stub, used for indexing
    end
    # d.friday?  ->  bool
    #  
    # Returns true if the date is Friday.
    def friday?()
        #This is a stub, used for indexing
    end
    # d.saturday?  ->  bool
    #  
    # Returns true if the date is Saturday.
    def saturday?()
        #This is a stub, used for indexing
    end
    # d.hour  ->  fixnum
    #  
    # Returns the hour (0-23).
    # 
    #    DateTime.new(2001,2,3,4,5,6).hour         #=> 4
    def hour()
        #This is a stub, used for indexing
    end
    # d.min     ->  fixnum
    # d.minute  ->  fixnum
    #  
    # Returns the minute (0-59).
    # 
    #    DateTime.new(2001,2,3,4,5,6).min          #=> 5
    def min(*several_variants)
        #This is a stub, used for indexing
    end
    # d.min     ->  fixnum
    # d.minute  ->  fixnum
    #  
    # Returns the minute (0-59).
    # 
    #    DateTime.new(2001,2,3,4,5,6).min          #=> 5
    def minute()
        #This is a stub, used for indexing
    end
    # d.sec     ->  fixnum
    # d.second  ->  fixnum
    #  
    # Returns the second (0-59).
    # 
    #    DateTime.new(2001,2,3,4,5,6).sec          #=> 6
    def sec(*several_variants)
        #This is a stub, used for indexing
    end
    # d.sec     ->  fixnum
    # d.second  ->  fixnum
    #  
    # Returns the second (0-59).
    # 
    #    DateTime.new(2001,2,3,4,5,6).sec          #=> 6
    def second()
        #This is a stub, used for indexing
    end
    # d.sec_fraction     ->  rational
    # d.second_fraction  ->  rational
    #  
    # Returns the fractional part of the second.
    # 
    #    DateTime.new(2001,2,3,4,5,6.5).sec_fraction       #=> (1/2)
    def sec_fraction()
        #This is a stub, used for indexing
    end
    # d.sec_fraction     ->  rational
    # d.second_fraction  ->  rational
    #  
    # Returns the fractional part of the second.
    # 
    #    DateTime.new(2001,2,3,4,5,6.5).sec_fraction       #=> (1/2)
    def second_fraction()
        #This is a stub, used for indexing
    end
    # d.offset  ->  rational
    #  
    # Returns the offset.
    # 
    #    DateTime.parse('04pm+0730').offset        #=> (5/16)
    def offset()
        #This is a stub, used for indexing
    end
    # d.zone  ->  string
    #  
    # Returns the timezone.
    # 
    #    DateTime.parse('04pm+0730').zone          #=> "+07:30"
    def zone()
        #This is a stub, used for indexing
    end
    # d.julian?  ->  bool
    #  
    # Retruns true if the date is before the day of calendar reform.
    # 
    #     Date.new(1582,10,15).julian?             #=> false
    #     (Date.new(1582,10,15) - 1).julian?       #=> true
    def julian?()
        #This is a stub, used for indexing
    end
    # d.gregorian?  ->  bool
    #  
    # Retunrs true if the date is on or after the day of calendar reform.
    # 
    #     Date.new(1582,10,15).gregorian?          #=> true
    #     (Date.new(1582,10,15) - 1).gregorian?    #=> false
    def gregorian?()
        #This is a stub, used for indexing
    end
    # d.leap?  ->  bool
    #  
    # Returns true if the year is a leap year.
    # 
    #    Date.new(2000).leap?      #=> true
    #    Date.new(2001).leap?      #=> false
    def leap?()
        #This is a stub, used for indexing
    end
    # d.start  ->  float
    #  
    # Returns the Julian day number denoting the day of calendar reform.
    # 
    #    Date.new(2001,2,3).start                  #=> 2299161.0
    #    Date.new(2001,2,3,Date::GREGORIAN).start  #=> -Infinity
    def start()
        #This is a stub, used for indexing
    end
    # d.new_start([start=Date::ITALY])  ->  date
    #  
    # Duplicates self and resets its the day of calendar reform.
    # 
    #    d = Date.new(1582,10,15)
    #    d.new_start(Date::JULIAN)         #=> #<Date: 1582-10-05 ...>
    def new_start(p1 = v1)
        #This is a stub, used for indexing
    end
    # d.italy  ->  date
    #  
    # This method is equivalent to new_start(Date::ITALY).
    def italy()
        #This is a stub, used for indexing
    end
    # d.england  ->  date
    #  
    # This method is equivalent to new_start(Date::ENGLAND).
    def england()
        #This is a stub, used for indexing
    end
    # d.julian  ->  date
    #  
    # This method is equivalent to new_start(Date::JULIAN).
    def julian()
        #This is a stub, used for indexing
    end
    # d.gregorian  ->  date
    #  
    # This method is equivalent to new_start(Date::GREGORIAN).
    def gregorian()
        #This is a stub, used for indexing
    end
    # d.new_offset([offset=0])  ->  date
    #  
    # Duplicates self and resets its offset.
    # 
    #    d = DateTime.new(2001,2,3,4,5,6,'-02:00')
    #                              #=> #<DateTime: 2001-02-03T04:05:06-02:00 ...>
    #    d.new_offset('+09:00')    #=> #<DateTime: 2001-02-03T15:05:06+09:00 ...>
    def new_offset(p1 = v1)
        #This is a stub, used for indexing
    end
    # d + other  ->  date
    #  
    # Returns a date object pointing other days after self.  The other
    # should be a numeric value.  If the other is flonum, assumes its
    # precision is at most nanosecond.
    # 
    #    Date.new(2001,2,3) + 1    #=> #<Date: 2001-02-04 ...>
    #    DateTime.new(2001,2,3) + Rational(1,2)
    #                              #=> #<DateTime: 2001-02-03T12:00:00+00:00 ...>
    #    DateTime.new(2001,2,3) + Rational(-1,2)
    #                              #=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
    #    DateTime.jd(0,12) + DateTime.new(2001,2,3).ajd
    #                              #=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>
    def + other
        #This is a stub, used for indexing
    end
    # d - other  ->  date or rational
    #  
    # Returns the difference between the two dates if the other is a date
    # object.  If the other is a numeric value, returns a date object
    # pointing other days before self.  If the other is flonum, assumes
    # its precision is at most nanosecond.
    # 
    #     Date.new(2001,2,3) - 1   #=> #<Date: 2001-02-02 ...>
    #     DateTime.new(2001,2,3) - Rational(1,2)
    #                              #=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
    #     Date.new(2001,2,3) - Date.new(2001)
    #                              #=> (33/1)
    #     DateTime.new(2001,2,3) - DateTime.new(2001,2,2,12)
    #                              #=> (1/2)
    def - other
        #This is a stub, used for indexing
    end
    # d.next_day([n=1])  ->  date
    #  
    # This method is equivalent to d + n.
    def next_day(p1 = v1)
        #This is a stub, used for indexing
    end
    # d.prev_day([n=1])  ->  date
    #  
    # This method is equivalent to d - n.
    def prev_day(p1 = v1)
        #This is a stub, used for indexing
    end
    # d.next  ->  date
    #  
    # Returns a date object denoting the following day.
    def next()
        #This is a stub, used for indexing
    end
    # d.next  ->  date
    #  
    # Returns a date object denoting the following day.
    def succ()
        #This is a stub, used for indexing
    end
    # d >> n  ->  date
    #  
    # Returns a date object pointing n months after self.  The n should
    # be a numeric value.
    # 
    #    Date.new(2001,2,3) >> 1   #=> #<Date: 2001-03-03 ...>
    #    Date.new(2001,1,31) >> 1  #=> #<Date: 2001-02-28 ...>
    #    Date.new(2001,2,3) >> -2  #=> #<Date: 2000-12-03 ...>
    def >> n
        #This is a stub, used for indexing
    end
    # d << n  ->  date
    #  
    # Returns a date object pointing n months before self.  The n should
    # be a numeric value.
    # 
    #    Date.new(2001,2,3) << 1   #=> #<Date: 2001-01-03 ...>
    #    Date.new(2001,1,31) << 11 #=> #<Date: 2000-02-29 ...>
    #    Date.new(2001,2,3) << -1  #=> #<Date: 2001-03-03 ...>
    def << n
        #This is a stub, used for indexing
    end
    # d.next_month([n=1])  ->  date
    #  
    # This method is equivalent to d >> n
    def next_month(p1 = v1)
        #This is a stub, used for indexing
    end
    # d.prev_month([n=1])  ->  date
    #  
    # This method is equivalent to d << n
    def prev_month(p1 = v1)
        #This is a stub, used for indexing
    end
    # d.next_year([n=1])  ->  date
    #  
    # This method is equivalent to d >> (n * 12)
    def next_year(p1 = v1)
        #This is a stub, used for indexing
    end
    # d.prev_year([n=1])  ->  date
    #  
    # This method is equivalent to d << (n * 12)
    def prev_year(p1 = v1)
        #This is a stub, used for indexing
    end
    # d.step(limit[, step=1])              ->  enumerator
    # d.step(limit[, step=1]){|date| ...}  ->  self
    #  
    # Iterates evaluation of the given block, which takes a date object.
    # The limit should be a date object.
    # 
    #    Date.new(2001).step(Date.new(2001,-1,-1)).select{|d| d.sunday?}.size
    #                              #=> 52
    def step(*several_variants)
        #This is a stub, used for indexing
    end
    # d.upto(max)              ->  enumerator
    # d.upto(max){|date| ...}  ->  self
    #  
    # This method is equivalent to step(max, 1){|date| ...}.
    def upto(*several_variants)
        #This is a stub, used for indexing
    end
    # d.downto(min)              ->  enumerator
    # d.downto(min){|date| ...}  ->  self
    #  
    # This method is equivalent to step(min, -1){|date| ...}.
    def downto(*several_variants)
        #This is a stub, used for indexing
    end
    # d <=> other  -> -1, 0, +1 or nil
    #  
    # Compares the two dates and returns -1, zero, 1 or nil.  The other
    # should be a date object or a numeric value as an astronomical
    # Julian day number.
    # 
    #    Date.new(2001,2,3) <=> Date.new(2001,2,4) #=> -1
    #    Date.new(2001,2,3) <=> Date.new(2001,2,3) #=> 0
    #    Date.new(2001,2,3) <=> Date.new(2001,2,2) #=> 1
    #    Date.new(2001,2,3) <=> Object.new         #=> nil
    #    Date.new(2001,2,3) <=> Rational(4903887,2)#=> 0
    # 
    # See also Comparable.
    def <=> other
        #This is a stub, used for indexing
    end
    # d === other  ->  bool
    #  
    # Returns true if they are the same day.
    # 
    #    Date.new(2001,2,3) === Date.new(2001,2,3)
    #                                      #=> true
    #    Date.new(2001,2,3) === Date.new(2001,2,4)
    #                                      #=> false
    #    DateTime.new(2001,2,3) === DateTime.new(2001,2,3,12)
    #                                      #=> true
    #    DateTime.new(2001,2,3) === DateTime.new(2001,2,3,0,0,0,'+24:00')
    #                                      #=> true
    #    DateTime.new(2001,2,3) === DateTime.new(2001,2,4,0,0,0,'+24:00')
    #                                      #=> false
    def === other
        #This is a stub, used for indexing
    end
    # d.to_s  ->  string
    #  
    # Returns a string in an ISO 8601 format (This method doesn't use the
    # expanded representations).
    # 
    #     Date.new(2001,2,3).to_s  #=> "2001-02-03"
    def to_s()
        #This is a stub, used for indexing
    end
    # d.inspect  ->  string
    #  
    # Returns the value as a string for inspection.
    # 
    #    Date.new(2001,2,3).inspect
    #              #=> "#<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>"
    #    DateTime.new(2001,2,3,4,5,6,'-7').inspect
    #              #=> "#<DateTime: 2001-02-03T04:05:06-07:00 ((2451944j,39906s,0n),-25200s,2299161j)>"
    def inspect()
        #This is a stub, used for indexing
    end
    # d.strftime([format='%F'])  ->  string
    #  
    #  Formats date according to the directives in the given format
    #  string.
    #  The directives begins with a percent (%) character.
    #  Any text not listed as a directive will be passed through to the
    #  output string.
    # 
    #  The directive consists of a percent (%) character,
    #  zero or more flags, optional minimum field width,
    #  optional modifier and a conversion specifier
    #  as follows.
    # 
    #    %<flags><width><modifier><conversion>
    # 
    #  Flags:
    #    -  don't pad a numerical output.
    #    _  use spaces for padding.
    #    0  use zeros for padding.
    #    ^  upcase the result string.
    #    #  change case.
    # 
    #  The minimum field width specifies the minimum width.
    # 
    #  The modifiers are "E", "O", ":", "::" and ":::".
    #  "E" and "O" are ignored.  No effect to result currently.
    # 
    #  Format directives:
    # 
    #    Date (Year, Month, Day):
    #      %Y - Year with century (can be negative, 4 digits at least)
    #              -0001, 0000, 1995, 2009, 14292, etc.
    #      %C - year / 100 (round down.  20 in 2009)
    #      %y - year % 100 (00..99)
    # 
    #      %m - Month of the year, zero-padded (01..12)
    #              %_m  blank-padded ( 1..12)
    #              %-m  no-padded (1..12)
    #      %B - The full month name (``January'')
    #              %^B  uppercased (``JANUARY'')
    #      %b - The abbreviated month name (``Jan'')
    #              %^b  uppercased (``JAN'')
    #      %h - Equivalent to %b
    # 
    #      %d - Day of the month, zero-padded (01..31)
    #              %-d  no-padded (1..31)
    #      %e - Day of the month, blank-padded ( 1..31)
    # 
    #      %j - Day of the year (001..366)
    # 
    #    Time (Hour, Minute, Second, Subsecond):
    #      %H - Hour of the day, 24-hour clock, zero-padded (00..23)
    #      %k - Hour of the day, 24-hour clock, blank-padded ( 0..23)
    #      %I - Hour of the day, 12-hour clock, zero-padded (01..12)
    #      %l - Hour of the day, 12-hour clock, blank-padded ( 1..12)
    #      %P - Meridian indicator, lowercase (``am'' or ``pm'')
    #      %p - Meridian indicator, uppercase (``AM'' or ``PM'')
    # 
    #      %M - Minute of the hour (00..59)
    # 
    #      %S - Second of the minute (00..59)
    # 
    #      %L - Millisecond of the second (000..999)
    #      %N - Fractional seconds digits, default is 9 digits (nanosecond)
    #              %3N  millisecond (3 digits)   %15N femtosecond (15 digits)
    #              %6N  microsecond (6 digits)   %18N attosecond  (18 digits)
    #              %9N  nanosecond  (9 digits)   %21N zeptosecond (21 digits)
    #              %12N picosecond (12 digits)   %24N yoctosecond (24 digits)
    # 
    #    Time zone:
    #      %z - Time zone as hour and minute offset from UTC (e.g. +0900)
    #              %:z - hour and minute offset from UTC with a colon (e.g. +09:00)
    #              %::z - hour, minute and second offset from UTC (e.g. +09:00:00)
    #              %:::z - hour, minute and second offset from UTC
    #                                                (e.g. +09, +09:30, +09:30:30)
    #      %Z - Time zone abbreviation name or something similar information.
    # 
    #    Weekday:
    #      %A - The full weekday name (``Sunday'')
    #              %^A  uppercased (``SUNDAY'')
    #      %a - The abbreviated name (``Sun'')
    #              %^a  uppercased (``SUN'')
    #      %u - Day of the week (Monday is 1, 1..7)
    #      %w - Day of the week (Sunday is 0, 0..6)
    # 
    #    ISO 8601 week-based year and week number:
    #    The week 1 of YYYY starts with a Monday and includes YYYY-01-04.
    #    The days in the year before the first week are in the last week of
    #    the previous year.
    #      %G - The week-based year
    #      %g - The last 2 digits of the week-based year (00..99)
    #      %V - Week number of the week-based year (01..53)
    # 
    #    Week number:
    #    The week 1 of YYYY starts with a Sunday or Monday (according to %U
    #    or %W).  The days in the year before the first week are in week 0.
    #      %U - Week number of the year.  The week starts with Sunday.  (00..53)
    #      %W - Week number of the year.  The week starts with Monday.  (00..53)
    # 
    #    Seconds since the Unix Epoch:
    #      %s - Number of seconds since 1970-01-01 00:00:00 UTC.
    #      %Q - Number of milliseconds since 1970-01-01 00:00:00 UTC.
    # 
    #    Literal string:
    #      %n - Newline character (\n)
    #      %t - Tab character (\t)
    #      %% - Literal ``%'' character
    # 
    #    Combination:
    #      %c - date and time (%a %b %e %T %Y)
    #      %D - Date (%m/%d/%y)
    #      %F - The ISO 8601 date format (%Y-%m-%d)
    #      %v - VMS date (%e-%b-%Y)
    #      %x - Same as %D
    #      %X - Same as %T
    #      %r - 12-hour time (%I:%M:%S %p)
    #      %R - 24-hour time (%H:%M)
    #      %T - 24-hour time (%H:%M:%S)
    #      %+ - date(1) (%a %b %e %H:%M:%S %Z %Y)
    # 
    #  This method is similar to strftime() function defined in ISO C and POSIX.
    #  Several directives (%a, %A, %b, %B, %c, %p, %r, %x, %X, %E*, %O* and %Z)
    #  are locale dependent in the function.
    #  However this method is locale independent.
    #  So, the result may differ even if a same format string is used in other
    #  systems such as C.
    #  It is good practice to avoid %x and %X because there are corresponding
    #  locale independent representations, %D and %T.
    # 
    #  Examples:
    # 
    #    d = DateTime.new(2007,11,19,8,37,48,"-06:00")
    #                              #=> #<DateTime: 2007-11-19T08:37:48-0600 ...>
    #    d.strftime("Printed on %m/%d/%Y")   #=> "Printed on 11/19/2007"
    #    d.strftime("at %I:%M%p")            #=> "at 08:37AM"
    # 
    #  Various ISO 8601 formats:
    #    %Y%m%d           => 20071119                  Calendar date (basic)
    #    %F               => 2007-11-19                Calendar date (extended)
    #    %Y-%m            => 2007-11                   Calendar date, reduced accuracy, specific month
    #    %Y               => 2007                      Calendar date, reduced accuracy, specific year
    #    %C               => 20                        Calendar date, reduced accuracy, specific century
    #    %Y%j             => 2007323                   Ordinal date (basic)
    #    %Y-%j            => 2007-323                  Ordinal date (extended)
    #    %GW%V%u          => 2007W471                  Week date (basic)
    #    %G-W%V-%u        => 2007-W47-1                Week date (extended)
    #    %GW%V            => 2007W47                   Week date, reduced accuracy, specific week (basic)
    #    %G-W%V           => 2007-W47                  Week date, reduced accuracy, specific week (extended)
    #    %H%M%S           => 083748                    Local time (basic)
    #    %T               => 08:37:48                  Local time (extended)
    #    %H%M             => 0837                      Local time, reduced accuracy, specific minute (basic)
    #    %H:%M            => 08:37                     Local time, reduced accuracy, specific minute (extended)
    #    %H               => 08                        Local time, reduced accuracy, specific hour
    #    %H%M%S,%L        => 083748,000                Local time with decimal fraction, comma as decimal sign (basic)
    #    %T,%L            => 08:37:48,000              Local time with decimal fraction, comma as decimal sign (extended)
    #    %H%M%S.%L        => 083748.000                Local time with decimal fraction, full stop as decimal sign (basic)
    #    %T.%L            => 08:37:48.000              Local time with decimal fraction, full stop as decimal sign (extended)
    #    %H%M%S%z         => 083748-0600               Local time and the difference from UTC (basic)
    #    %T%:z            => 08:37:48-06:00            Local time and the difference from UTC (extended)
    #    %Y%m%dT%H%M%S%z  => 20071119T083748-0600      Date and time of day for calendar date (basic)
    #    %FT%T%:z         => 2007-11-19T08:37:48-06:00 Date and time of day for calendar date (extended)
    #    %Y%jT%H%M%S%z    => 2007323T083748-0600       Date and time of day for ordinal date (basic)
    #    %Y-%jT%T%:z      => 2007-323T08:37:48-06:00   Date and time of day for ordinal date (extended)
    #    %GW%V%uT%H%M%S%z => 2007W471T083748-0600      Date and time of day for week date (basic)
    #    %G-W%V-%uT%T%:z  => 2007-W47-1T08:37:48-06:00 Date and time of day for week date (extended)
    #    %Y%m%dT%H%M      => 20071119T0837             Calendar date and local time (basic)
    #    %FT%R            => 2007-11-19T08:37          Calendar date and local time (extended)
    #    %Y%jT%H%MZ       => 2007323T0837Z             Ordinal date and UTC of day (basic)
    #    %Y-%jT%RZ        => 2007-323T08:37Z           Ordinal date and UTC of day (extended)
    #    %GW%V%uT%H%M%z   => 2007W471T0837-0600        Week date and local time and difference from UTC (basic)
    #    %G-W%V-%uT%R%:z  => 2007-W47-1T08:37-06:00    Week date and local time and difference from UTC (extended)
    # 
    # See also strftime(3) and strptime.
    def strftime(*args)
        #This is a stub, used for indexing
    end
    # d.asctime  ->  string
    # d.ctime    ->  string
    #  
    # Returns a string in asctime(3) format (but without "\n\0" at the
    # end).  This method is equivalent to strftime('%c').
    # 
    # See also asctime(3) or ctime(3).
    def asctime()
        #This is a stub, used for indexing
    end
    # d.asctime  ->  string
    # d.ctime    ->  string
    #  
    # Returns a string in asctime(3) format (but without "\n\0" at the
    # end).  This method is equivalent to strftime('%c').
    # 
    # See also asctime(3) or ctime(3).
    def ctime()
        #This is a stub, used for indexing
    end
    # d.iso8601    ->  string
    # d.xmlschema  ->  string
    #  
    # This method is equivalent to strftime('%F').
    def iso8601()
        #This is a stub, used for indexing
    end
    # d.iso8601    ->  string
    # d.xmlschema  ->  string
    #  
    # This method is equivalent to strftime('%F').
    def xmlschema()
        #This is a stub, used for indexing
    end
    # d.rfc3339  ->  string
    #  
    # This method is equivalent to strftime('%FT%T%:z').
    def rfc3339()
        #This is a stub, used for indexing
    end
    # d.rfc2822  ->  string
    # d.rfc822   ->  string
    #  
    # This method is equivalent to strftime('%a, %-d %b %Y %T %z').
    def rfc2822()
        #This is a stub, used for indexing
    end
    # d.rfc2822  ->  string
    # d.rfc822   ->  string
    #  
    # This method is equivalent to strftime('%a, %-d %b %Y %T %z').
    def rfc822()
        #This is a stub, used for indexing
    end
    # d.httpdate  ->  string
    #  
    # This method is equivalent to strftime('%a, %d %b %Y %T GMT').
    # See also RFC 2616.
    def httpdate()
        #This is a stub, used for indexing
    end
    # d.jisx0301  ->  string
    #  
    # Returns a string in a JIS X 0301 format.
    # 
    #    Date.new(2001,2,3).jisx0301       #=> "H13.02.03"
    def jisx0301()
        #This is a stub, used for indexing
    end
    # d.to_time  ->  time
    #  
    # Returns a Time object which denotes self.
    def to_time()
        #This is a stub, used for indexing
    end
    # d.to_date  ->  self
    #  
    # Returns self;
    def to_date()
        #This is a stub, used for indexing
    end
    # d.to_datetime  -> datetime
    #  
    # Returns a DateTime object which denotes self.
    def to_datetime()
        #This is a stub, used for indexing
    end
end
