=begin
 This is a machine generated stub using stdlib-doc for <b>class Regexp</b>
 Sources used:  Ruby 2.0.0-p247
 Created on 2013-07-25 12:30:22 +0400 by IntelliJ Ruby Stubs Generator.
=end

# A <code>Regexp</code> holds a regular expression, used to match a pattern
# against strings. Regexps are created using the <code>/.../</code> and
# <code>%r{...}</code> literals, and by the <code>Regexp::new</code>
# constructor.
# 
# Regular expressions (<i>regexp</i>s) are patterns which describe the
# contents of a string. They're used for testing whether a string contains a
# given pattern, or extracting the portions that match. They are created
# with the <tt>/</tt><i>pat</i><tt>/</tt> and
# <tt>%r{</tt><i>pat</i><tt>}</tt> literals or the <tt>Regexp.new</tt>
# constructor.
# 
# A regexp is usually delimited with forward slashes (<tt>/</tt>). For
# example:
# 
#     /hay/ =~ 'haystack'   #=> 0
#     /y/.match('haystack') #=> #<MatchData "y">
# 
# If a string contains the pattern it is said to <i>match</i>. A literal
# string matches itself.
# 
#     # 'haystack' does not contain the pattern 'needle', so doesn't match.
#     /needle/.match('haystack') #=> nil
#     # 'haystack' does contain the pattern 'hay', so it matches
#     /hay/.match('haystack')    #=> #<MatchData "hay">
# 
# Specifically, <tt>/st/</tt> requires that the string contains the letter
# _s_ followed by the letter _t_, so it matches _haystack_, also.
# 
# == <tt>=~</tt> and Regexp#match
# 
# Pattern matching may be achieved by using <tt>=~</tt> operator or Regexp#match
# method.
# 
# === <tt>=~</tt> operator
# 
# <tt>=~</tt> is Ruby's basic pattern-matching operator.  When one operand is a
# regular expression and the other is a string then the regular expression is
# used as a pattern to match against the string.  (This operator is equivalently
# defined by Regexp and String so the order of String and Regexp do not matter.
# Other classes may have different implementations of <tt>=~</tt>.)  If a match
# is found, the operator returns index of first match in string, otherwise it
# returns +nil+.
# 
#     /hay/ =~ 'haystack'   #=> 0
#     'haystack' =~ /hay/   #=> 0
#     /a/   =~ 'haystack'   #=> 1
#     /u/   =~ 'haystack'   #=> nil
# 
# Using <tt>=~</tt> operator with a String and Regexp the <tt>$~</tt> global
# variable is set after a successful match.  <tt>$~</tt> holds a MatchData
# object. Regexp.last_match is equivalent to <tt>$~</tt>.
# 
# === Regexp#match method
# 
# #match method return a MatchData object :
# 
#     /st/.match('haystack')   #=> #<MatchData "st">
# 
# == Metacharacters and Escapes
# 
# The following are <i>metacharacters</i> <tt>(</tt>, <tt>)</tt>,
# <tt>[</tt>, <tt>]</tt>, <tt>{</tt>, <tt>}</tt>, <tt>.</tt>, <tt>?</tt>,
# <tt>+</tt>, <tt>*</tt>. They have a specific meaning when appearing in a
# pattern. To match them literally they must be backslash-escaped. To match
# a backslash literally backslash-escape that: <tt>\\\\\\</tt>.
# 
#     /1 \+ 2 = 3\?/.match('Does 1 + 2 = 3?') #=> #<MatchData "1 + 2 = 3?">
# 
# Patterns behave like double-quoted strings so can contain the same
# backslash escapes.
# 
#     /\s\u{6771 4eac 90fd}/.match("Go to 東京都")
#         #=> #<MatchData " 東京都">
# 
# Arbitrary Ruby expressions can be embedded into patterns with the
# <tt>#{...}</tt> construct.
# 
#     place = "東京都"
#     /#{place}/.match("Go to 東京都")
#         #=> #<MatchData "東京都">
# 
# == Character Classes
# 
# A <i>character class</i> is delimited with square brackets (<tt>[</tt>,
# <tt>]</tt>) and lists characters that may appear at that point in the
# match. <tt>/[ab]/</tt> means _a_ or _b_, as opposed to <tt>/ab/</tt> which
# means _a_ followed by _b_.
# 
#     /W[aeiou]rd/.match("Word") #=> #<MatchData "Word">
# 
# Within a character class the hyphen (<tt>-</tt>) is a metacharacter
# denoting an inclusive range of characters. <tt>[abcd]</tt> is equivalent
# to <tt>[a-d]</tt>. A range can be followed by another range, so
# <tt>[abcdwxyz]</tt> is equivalent to <tt>[a-dw-z]</tt>. The order in which
# ranges or individual characters appear inside a character class is
# irrelevant.
# 
#     /[0-9a-f]/.match('9f') #=> #<MatchData "9">
#     /[9f]/.match('9f')     #=> #<MatchData "9">
# 
# If the first character of a character class is a caret (<tt>^</tt>) the
# class is inverted: it matches any character _except_ those named.
# 
#     /[^a-eg-z]/.match('f') #=> #<MatchData "f">
# 
# A character class may contain another character class. By itself this
# isn't useful because <tt>[a-z[0-9]]</tt> describes the same set as
# <tt>[a-z0-9]</tt>. However, character classes also support the <tt>&&</tt>
# operator which performs set intersection on its arguments. The two can be
# combined as follows:
# 
#     /[a-w&&[^c-g]z]/ # ([a-w] AND ([^c-g] OR z))
#     # This is equivalent to:
#     /[abh-w]/
# 
# The following metacharacters also behave like character classes:
# 
# * <tt>/./</tt> - Any character except a newline.
# * <tt>/./m</tt> - Any character (the +m+ modifier enables multiline mode)
# * <tt>/\w/</tt> - A word character (<tt>[a-zA-Z0-9_]</tt>)
# * <tt>/\W/</tt> - A non-word character (<tt>[^a-zA-Z0-9_]</tt>)
# * <tt>/\d/</tt> - A digit character (<tt>[0-9]</tt>)
# * <tt>/\D/</tt> - A non-digit character (<tt>[^0-9]</tt>)
# * <tt>/\h/</tt> - A hexdigit character (<tt>[0-9a-fA-F]</tt>)
# * <tt>/\H/</tt> - A non-hexdigit character (<tt>[^0-9a-fA-F]</tt>)
# * <tt>/\s/</tt> - A whitespace character: <tt>/[ \t\r\n\f]/</tt>
# * <tt>/\S/</tt> - A non-whitespace character: <tt>/[^ \t\r\n\f]/</tt>
# 
# POSIX <i>bracket expressions</i> are also similar to character classes.
# They provide a portable alternative to the above, with the added benefit
# that they encompass non-ASCII characters. For instance, <tt>/\d/</tt>
# matches only the ASCII decimal digits (0-9); whereas <tt>/[[:digit:]]/</tt>
# matches any character in the Unicode _Nd_ category.
# 
# * <tt>/[[:alnum:]]/</tt> - Alphabetic and numeric character
# * <tt>/[[:alpha:]]/</tt> - Alphabetic character
# * <tt>/[[:blank:]]/</tt> - Space or tab
# * <tt>/[[:cntrl:]]/</tt> - Control character
# * <tt>/[[:digit:]]/</tt> - Digit
# * <tt>/[[:graph:]]/</tt> - Non-blank character (excludes spaces, control
#   characters, and similar)
# * <tt>/[[:lower:]]/</tt> - Lowercase alphabetical character
# * <tt>/[[:print:]]/</tt> - Like [:graph:], but includes the space character
# * <tt>/[[:punct:]]/</tt> - Punctuation character
# * <tt>/[[:space:]]/</tt> - Whitespace character (<tt>[:blank:]</tt>, newline,
#   carriage return, etc.)
# * <tt>/[[:upper:]]/</tt> - Uppercase alphabetical
# * <tt>/[[:xdigit:]]/</tt> - Digit allowed in a hexadecimal number (i.e.,
#   0-9a-fA-F)
# 
# Ruby also supports the following non-POSIX character classes:
# 
# * <tt>/[[:word:]]/</tt> - A character in one of the following Unicode
#   general categories _Letter_, _Mark_, _Number_,
#   <i>Connector_Punctuation</i>
# * <tt>/[[:ascii:]]/</tt> - A character in the ASCII character set
# 
#     # U+06F2 is "EXTENDED ARABIC-INDIC DIGIT TWO"
#     /[[:digit:]]/.match("\u06F2")    #=> #<MatchData "\u{06F2}">
#     /[[:upper:]][[:lower:]]/.match("Hello") #=> #<MatchData "He">
#     /[[:xdigit:]][[:xdigit:]]/.match("A6")  #=> #<MatchData "A6">
# 
# == Repetition
# 
# The constructs described so far match a single character. They can be
# followed by a repetition metacharacter to specify how many times they need
# to occur. Such metacharacters are called <i>quantifiers</i>.
# 
# * <tt>*</tt> - Zero or more times
# * <tt>+</tt> - One or more times
# * <tt>?</tt> - Zero or one times (optional)
# * <tt>{</tt><i>n</i><tt>}</tt> - Exactly <i>n</i> times
# * <tt>{</tt><i>n</i><tt>,}</tt> - <i>n</i> or more times
# * <tt>{,</tt><i>m</i><tt>}</tt> - <i>m</i> or less times
# * <tt>{</tt><i>n</i><tt>,</tt><i>m</i><tt>}</tt> - At least <i>n</i> and
#   at most <i>m</i> times
# 
#     # At least one uppercase character ('H'), at least one lowercase
#     # character ('e'), two 'l' characters, then one 'o'
#     "Hello".match(/[[:upper:]]+[[:lower:]]+l{2}o/) #=> #<MatchData "Hello">
# 
# Repetition is <i>greedy</i> by default: as many occurrences as possible
# are matched while still allowing the overall match to succeed. By
# contrast, <i>lazy</i> matching makes the minimal amount of matches
# necessary for overall success. A greedy metacharacter can be made lazy by
# following it with <tt>?</tt>.
# 
#     # Both patterns below match the string. The first uses a greedy
#     # quantifier so '.+' matches '<a><b>'; the second uses a lazy
#     # quantifier so '.+?' matches '<a>'.
#     /<.+>/.match("<a><b>")  #=> #<MatchData "<a><b>">
#     /<.+?>/.match("<a><b>") #=> #<MatchData "<a>">
# 
# A quantifier followed by <tt>+</tt> matches <i>possessively</i>: once it
# has matched it does not backtrack. They behave like greedy quantifiers,
# but having matched they refuse to "give up" their match even if this
# jeopardises the overall match.
# 
# == Capturing
# 
# Parentheses can be used for <i>capturing</i>. The text enclosed by the
# <i>n</i><sup>th</sup> group of parentheses can be subsequently referred to
# with <i>n</i>. Within a pattern use the <i>backreference</i>
# <tt>\n</tt>; outside of the pattern use
# <tt>MatchData[</tt><i>n</i><tt>]</tt>.
# 
#     # 'at' is captured by the first group of parentheses, then referred to
#     # later with \1
#     /[csh](..) [csh]\1 in/.match("The cat sat in the hat")
#         #=> #<MatchData "cat sat in" 1:"at">
#     # Regexp#match returns a MatchData object which makes the captured
#     # text available with its #[] method.
#     /[csh](..) [csh]\1 in/.match("The cat sat in the hat")[1] #=> 'at'
# 
# Capture groups can be referred to by name when defined with the
# <tt>(?<</tt><i>name</i><tt>>)</tt> or <tt>(?'</tt><i>name</i><tt>')</tt>
# constructs.
# 
#     /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")
#         => #<MatchData "$3.67" dollars:"3" cents:"67">
#     /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")[:dollars] #=> "3"
# 
# Named groups can be backreferenced with <tt>\k<</tt><i>name</i><tt>></tt>,
# where _name_ is the group name.
# 
#     /(?<vowel>[aeiou]).\k<vowel>.\k<vowel>/.match('ototomy')
#         #=> #<MatchData "ototo" vowel:"o">
# 
# *Note*: A regexp can't use named backreferences and numbered
# backreferences simultaneously.
# 
# When named capture groups are used with a literal regexp on the left-hand
# side of an expression and the <tt>=~</tt> operator, the captured text is
# also assigned to local variables with corresponding names.
# 
#     /\$(?<dollars>\d+)\.(?<cents>\d+)/ =~ "$3.67" #=> 0
#     dollars #=> "3"
# 
# == Grouping
# 
# Parentheses also <i>group</i> the terms they enclose, allowing them to be
# quantified as one <i>atomic</i> whole.
# 
#     # The pattern below matches a vowel followed by 2 word characters:
#     # 'aen'
#     /[aeiou]\w{2}/.match("Caenorhabditis elegans") #=> #<MatchData "aen">
#     # Whereas the following pattern matches a vowel followed by a word
#     # character, twice, i.e. <tt>[aeiou]\w[aeiou]\w</tt>: 'enor'.
#     /([aeiou]\w){2}/.match("Caenorhabditis elegans")
#         #=> #<MatchData "enor" 1:"or">
# 
# The <tt>(?:</tt>...<tt>)</tt> construct provides grouping without
# capturing. That is, it combines the terms it contains into an atomic whole
# without creating a backreference. This benefits performance at the slight
# expense of readability.
# 
#     # The group of parentheses captures 'n' and the second 'ti'. The
#     # second group is referred to later with the backreference \2
#     /I(n)ves(ti)ga\2ons/.match("Investigations")
#         #=> #<MatchData "Investigations" 1:"n" 2:"ti">
#     # The first group of parentheses is now made non-capturing with '?:',
#     # so it still matches 'n', but doesn't create the backreference. Thus,
#     # the backreference \1 now refers to 'ti'.
#     /I(?:n)ves(ti)ga\1ons/.match("Investigations")
#         #=> #<MatchData "Investigations" 1:"ti">
# 
# === Atomic Grouping
# 
# Grouping can be made <i>atomic</i> with
# <tt>(?></tt><i>pat</i><tt>)</tt>. This causes the subexpression <i>pat</i>
# to be matched independently of the rest of the expression such that what
# it matches becomes fixed for the remainder of the match, unless the entire
# subexpression must be abandoned and subsequently revisited. In this
# way <i>pat</i> is treated as a non-divisible whole. Atomic grouping is
# typically used to optimise patterns so as to prevent the regular
# expression engine from backtracking needlessly.
# 
#     # The <tt>"</tt> in the pattern below matches the first character of
#     # the string, then <tt>.*</tt> matches <i>Quote"</i>. This causes the
#     # overall match to fail, so the text matched by <tt>.*</tt> is
#     # backtracked by one position, which leaves the final character of the
#     # string available to match <tt>"</tt>
#           /".*"/.match('"Quote"')     #=> #<MatchData "\"Quote\"">
#     # If <tt>.*</tt> is grouped atomically, it refuses to backtrack
#     # <i>Quote"</i>, even though this means that the overall match fails
#     /"(?>.*)"/.match('"Quote"') #=> nil
# 
# == Subexpression Calls
# 
# The <tt>\g<</tt><i>name</i><tt>></tt> syntax matches the previous
# subexpression named _name_, which can be a group name or number, again.
# This differs from backreferences in that it re-executes the group rather
# than simply trying to re-match the same text.
# 
#     # Matches a <i>(</i> character and assigns it to the <tt>paren</tt>
#     # group, tries to call that the <tt>paren</tt> sub-expression again
#     # but fails, then matches a literal <i>)</i>.
#     /\A(?<paren>\(\g<paren>*\))*\z/ =~ '()'
# 
# 
#     /\A(?<paren>\(\g<paren>*\))*\z/ =~ '(())' #=> 0
#     # ^1
#     #      ^2
#     #           ^3
#     #                 ^4
#     #      ^5
#     #           ^6
#     #                      ^7
#     #                       ^8
#     #                       ^9
#     #                           ^10
# 
# 1.  Matches at the beginning of the string, i.e. before the first
#     character.
# 2.  Enters a named capture group called <tt>paren</tt>
# 3.  Matches a literal <i>(</i>, the first character in the string
# 4.  Calls the <tt>paren</tt> group again, i.e. recurses back to the
#     second step
# 5.  Re-enters the <tt>paren</tt> group
# 6.  Matches a literal <i>(</i>, the second character in the
#     string
# 7.  Try to call <tt>paren</tt> a third time, but fail because
#     doing so would prevent an overall successful match
# 8.  Match a literal <i>)</i>, the third character in the string.
#     Marks the end of the second recursive call
# 9.  Match a literal <i>)</i>, the fourth character in the string
# 10. Match the end of the string
# 
# == Alternation
# 
# The vertical bar metacharacter (<tt>|</tt>) combines two expressions into
# a single one that matches either of the expressions. Each expression is an
# <i>alternative</i>.
# 
#     /\w(and|or)\w/.match("Feliformia") #=> #<MatchData "form" 1:"or">
#     /\w(and|or)\w/.match("furandi")    #=> #<MatchData "randi" 1:"and">
#     /\w(and|or)\w/.match("dissemblance") #=> nil
# 
# == Character Properties
# 
# The <tt>\p{}</tt> construct matches characters with the named property,
# much like POSIX bracket classes.
# 
# * <tt>/\p{Alnum}/</tt> - Alphabetic and numeric character
# * <tt>/\p{Alpha}/</tt> - Alphabetic character
# * <tt>/\p{Blank}/</tt> - Space or tab
# * <tt>/\p{Cntrl}/</tt> - Control character
# * <tt>/\p{Digit}/</tt> - Digit
# * <tt>/\p{Graph}/</tt> - Non-blank character (excludes spaces, control
#   characters, and similar)
# * <tt>/\p{Lower}/</tt> - Lowercase alphabetical character
# * <tt>/\p{Print}/</tt> - Like <tt>\p{Graph}</tt>, but includes the space character
# * <tt>/\p{Punct}/</tt> - Punctuation character
# * <tt>/\p{Space}/</tt> - Whitespace character (<tt>[:blank:]</tt>, newline,
#   carriage return, etc.)
# * <tt>/\p{Upper}/</tt> - Uppercase alphabetical
# * <tt>/\p{XDigit}/</tt> - Digit allowed in a hexadecimal number (i.e., 0-9a-fA-F)
# * <tt>/\p{Word}/</tt> - A member of one of the following Unicode general
#   category <i>Letter</i>, <i>Mark</i>, <i>Number</i>,
#   <i>Connector\_Punctuation</i>
# * <tt>/\p{ASCII}/</tt> - A character in the ASCII character set
# * <tt>/\p{Any}/</tt> - Any Unicode character (including unassigned
#   characters)
# * <tt>/\p{Assigned}/</tt> - An assigned character
# 
# A Unicode character's <i>General Category</i> value can also be matched
# with <tt>\p{</tt><i>Ab</i><tt>}</tt> where <i>Ab</i> is the category's
# abbreviation as described below:
# 
# * <tt>/\p{L}/</tt> - 'Letter'
# * <tt>/\p{Ll}/</tt> - 'Letter: Lowercase'
# * <tt>/\p{Lm}/</tt> - 'Letter: Mark'
# * <tt>/\p{Lo}/</tt> - 'Letter: Other'
# * <tt>/\p{Lt}/</tt> - 'Letter: Titlecase'
# * <tt>/\p{Lu}/</tt> - 'Letter: Uppercase
# * <tt>/\p{Lo}/</tt> - 'Letter: Other'
# * <tt>/\p{M}/</tt> - 'Mark'
# * <tt>/\p{Mn}/</tt> - 'Mark: Nonspacing'
# * <tt>/\p{Mc}/</tt> - 'Mark: Spacing Combining'
# * <tt>/\p{Me}/</tt> - 'Mark: Enclosing'
# * <tt>/\p{N}/</tt> - 'Number'
# * <tt>/\p{Nd}/</tt> - 'Number: Decimal Digit'
# * <tt>/\p{Nl}/</tt> - 'Number: Letter'
# * <tt>/\p{No}/</tt> - 'Number: Other'
# * <tt>/\p{P}/</tt> - 'Punctuation'
# * <tt>/\p{Pc}/</tt> - 'Punctuation: Connector'
# * <tt>/\p{Pd}/</tt> - 'Punctuation: Dash'
# * <tt>/\p{Ps}/</tt> - 'Punctuation: Open'
# * <tt>/\p{Pe}/</tt> - 'Punctuation: Close'
# * <tt>/\p{Pi}/</tt> - 'Punctuation: Initial Quote'
# * <tt>/\p{Pf}/</tt> - 'Punctuation: Final Quote'
# * <tt>/\p{Po}/</tt> - 'Punctuation: Other'
# * <tt>/\p{S}/</tt> - 'Symbol'
# * <tt>/\p{Sm}/</tt> - 'Symbol: Math'
# * <tt>/\p{Sc}/</tt> - 'Symbol: Currency'
# * <tt>/\p{Sc}/</tt> - 'Symbol: Currency'
# * <tt>/\p{Sk}/</tt> - 'Symbol: Modifier'
# * <tt>/\p{So}/</tt> - 'Symbol: Other'
# * <tt>/\p{Z}/</tt> - 'Separator'
# * <tt>/\p{Zs}/</tt> - 'Separator: Space'
# * <tt>/\p{Zl}/</tt> - 'Separator: Line'
# * <tt>/\p{Zp}/</tt> - 'Separator: Paragraph'
# * <tt>/\p{C}/</tt> - 'Other'
# * <tt>/\p{Cc}/</tt> - 'Other: Control'
# * <tt>/\p{Cf}/</tt> - 'Other: Format'
# * <tt>/\p{Cn}/</tt> - 'Other: Not Assigned'
# * <tt>/\p{Co}/</tt> - 'Other: Private Use'
# * <tt>/\p{Cs}/</tt> - 'Other: Surrogate'
# 
# Lastly, <tt>\p{}</tt> matches a character's Unicode <i>script</i>. The
# following scripts are supported: <i>Arabic</i>, <i>Armenian</i>,
# <i>Balinese</i>, <i>Bengali</i>, <i>Bopomofo</i>, <i>Braille</i>,
# <i>Buginese</i>, <i>Buhid</i>, <i>Canadian_Aboriginal</i>, <i>Carian</i>,
# <i>Cham</i>, <i>Cherokee</i>, <i>Common</i>, <i>Coptic</i>,
# <i>Cuneiform</i>, <i>Cypriot</i>, <i>Cyrillic</i>, <i>Deseret</i>,
# <i>Devanagari</i>, <i>Ethiopic</i>, <i>Georgian</i>, <i>Glagolitic</i>,
# <i>Gothic</i>, <i>Greek</i>, <i>Gujarati</i>, <i>Gurmukhi</i>, <i>Han</i>,
# <i>Hangul</i>, <i>Hanunoo</i>, <i>Hebrew</i>, <i>Hiragana</i>,
# <i>Inherited</i>, <i>Kannada</i>, <i>Katakana</i>, <i>Kayah_Li</i>,
# <i>Kharoshthi</i>, <i>Khmer</i>, <i>Lao</i>, <i>Latin</i>, <i>Lepcha</i>,
# <i>Limbu</i>, <i>Linear_B</i>, <i>Lycian</i>, <i>Lydian</i>,
# <i>Malayalam</i>, <i>Mongolian</i>, <i>Myanmar</i>, <i>New_Tai_Lue</i>,
# <i>Nko</i>, <i>Ogham</i>, <i>Ol_Chiki</i>, <i>Old_Italic</i>,
# <i>Old_Persian</i>, <i>Oriya</i>, <i>Osmanya</i>, <i>Phags_Pa</i>,
# <i>Phoenician</i>, <i>Rejang</i>, <i>Runic</i>, <i>Saurashtra</i>,
# <i>Shavian</i>, <i>Sinhala</i>, <i>Sundanese</i>, <i>Syloti_Nagri</i>,
# <i>Syriac</i>, <i>Tagalog</i>, <i>Tagbanwa</i>, <i>Tai_Le</i>,
# <i>Tamil</i>, <i>Telugu</i>, <i>Thaana</i>, <i>Thai</i>, <i>Tibetan</i>,
# <i>Tifinagh</i>, <i>Ugaritic</i>, <i>Vai</i>, and <i>Yi</i>.
# 
#     # Unicode codepoint U+06E9 is named "ARABIC PLACE OF SAJDAH" and
#     # belongs to the Arabic script.
#     /\p{Arabic}/.match("\u06E9") #=> #<MatchData "\u06E9">
# 
# All character properties can be inverted by prefixing their name with a
# caret (<tt>^</tt>).
# 
#     # Letter 'A' is not in the Unicode Ll (Letter; Lowercase) category, so
#     # this match succeeds
#     /\p{^Ll}/.match("A") #=> #<MatchData "A">
# 
# == Anchors
# 
# Anchors are metacharacter that match the zero-width positions between
# characters, <i>anchoring</i> the match to a specific position.
# 
# * <tt>^</tt> - Matches beginning of line
# * <tt>$</tt> - Matches end of line
# * <tt>\A</tt> - Matches beginning of string.
# * <tt>\Z</tt> - Matches end of string. If string ends with a newline,
#   it matches just before newline
# * <tt>\z</tt> - Matches end of string
# * <tt>\G</tt> - Matches point where last match finished
# * <tt>\b</tt> - Matches word boundaries when outside brackets;
#   backspace (0x08) when inside brackets
# * <tt>\B</tt> - Matches non-word boundaries
# * <tt>(?=</tt><i>pat</i><tt>)</tt> - <i>Positive lookahead</i> assertion:
#   ensures that the following characters match <i>pat</i>, but doesn't
#   include those characters in the matched text
# * <tt>(?!</tt><i>pat</i><tt>)</tt> - <i>Negative lookahead</i> assertion:
#   ensures that the following characters do not match <i>pat</i>, but
#   doesn't include those characters in the matched text
# * <tt>(?<=</tt><i>pat</i><tt>)</tt> - <i>Positive lookbehind</i>
#   assertion: ensures that the preceding characters match <i>pat</i>, but
#   doesn't include those characters in the matched text
# * <tt>(?<!</tt><i>pat</i><tt>)</tt> - <i>Negative lookbehind</i>
#   assertion: ensures that the preceding characters do not match
#   <i>pat</i>, but doesn't include those characters in the matched text
# 
#     # If a pattern isn't anchored it can begin at any point in the string
#     /real/.match("surrealist") #=> #<MatchData "real">
#     # Anchoring the pattern to the beginning of the string forces the
#     # match to start there. 'real' doesn't occur at the beginning of the
#     # string, so now the match fails
#     /\Areal/.match("surrealist") #=> nil
#     # The match below fails because although 'Demand' contains 'and', the
#     pattern does not occur at a word boundary.
#     /\band/.match("Demand")
#     # Whereas in the following example 'and' has been anchored to a
#     # non-word boundary so instead of matching the first 'and' it matches
#     # from the fourth letter of 'demand' instead
#     /\Band.+/.match("Supply and demand curve") #=> #<MatchData "and curve">
#     # The pattern below uses positive lookahead and positive lookbehind to
#     # match text appearing in <b></b> tags without including the tags in the
#     # match
#     /(?<=<b>)\w+(?=<\/b>)/.match("Fortune favours the <b>bold</b>")
#         #=> #<MatchData "bold">
# 
# == Options
# 
# The end delimiter for a regexp can be followed by one or more single-letter
# options which control how the pattern can match.
# 
# * <tt>/pat/i</tt> - Ignore case
# * <tt>/pat/m</tt> - Treat a newline as a character matched by <tt>.</tt>
# * <tt>/pat/x</tt> - Ignore whitespace and comments in the pattern
# * <tt>/pat/o</tt> - Perform <tt>#{}</tt> interpolation only once
# 
# <tt>i</tt>, <tt>m</tt>, and <tt>x</tt> can also be applied on the
# subexpression level with the
# <tt>(?</tt><i>on</i><tt>-</tt><i>off</i><tt>)</tt> construct, which
# enables options <i>on</i>, and disables options <i>off</i> for the
# expression enclosed by the parentheses.
# 
#     /a(?i:b)c/.match('aBc') #=> #<MatchData "aBc">
#     /a(?i:b)c/.match('abc') #=> #<MatchData "abc">
# 
# Options may also be used with <tt>Regexp.new</tt>:
# 
#     Regexp.new("abc", Regexp::IGNORECASE)                     #=> /abc/i
#     Regexp.new("abc", Regexp::MULTILINE)                      #=> /abc/m
#     Regexp.new("abc # Comment", Regexp::EXTENDED)             #=> /abc # Comment/x
#     Regexp.new("abc", Regexp::IGNORECASE | Regexp::MULTILINE) #=> /abc/mi
# 
# == Free-Spacing Mode and Comments
# 
# As mentioned above, the <tt>x</tt> option enables <i>free-spacing</i>
# mode. Literal white space inside the pattern is ignored, and the
# octothorpe (<tt>#</tt>) character introduces a comment until the end of
# the line. This allows the components of the pattern to be organised in a
# potentially more readable fashion.
# 
#     # A contrived pattern to match a number with optional decimal places
#     float_pat = /\A
#         [[:digit:]]+ # 1 or more digits before the decimal point
#         (\.          # Decimal point
#             [[:digit:]]+ # 1 or more digits after the decimal point
#         )? # The decimal point and following digits are optional
#     \Z/x
#     float_pat.match('3.14') #=> #<MatchData "3.14" 1:".14">
# 
# *Note*: To match whitespace in an <tt>x</tt> pattern use an escape such as
# <tt>\s</tt> or <tt>\p{Space}</tt>.
# 
# Comments can be included in a non-<tt>x</tt> pattern with the
# <tt>(?#</tt><i>comment</i><tt>)</tt> construct, where <i>comment</i> is
# arbitrary text ignored by the regexp engine.
# 
# == Encoding
# 
# Regular expressions are assumed to use the source encoding. This can be
# overridden with one of the following modifiers.
# 
# * <tt>/</tt><i>pat</i><tt>/u</tt> - UTF-8
# * <tt>/</tt><i>pat</i><tt>/e</tt> - EUC-JP
# * <tt>/</tt><i>pat</i><tt>/s</tt> - Windows-31J
# * <tt>/</tt><i>pat</i><tt>/n</tt> - ASCII-8BIT
# 
# A regexp can be matched against a string when they either share an
# encoding, or the regexp's encoding is _US-ASCII_ and the string's encoding
# is ASCII-compatible.
# 
# If a match between incompatible encodings is attempted an
# <tt>Encoding::CompatibilityError</tt> exception is raised.
# 
# The <tt>Regexp#fixed_encoding?</tt> predicate indicates whether the regexp
# has a <i>fixed</i> encoding, that is one incompatible with ASCII. A
# regexp's encoding can be explicitly fixed by supplying
# <tt>Regexp::FIXEDENCODING</tt> as the second argument of
# <tt>Regexp.new</tt>:
# 
#     r = Regexp.new("a".force_encoding("iso-8859-1"),Regexp::FIXEDENCODING)
#     r =~"a\u3042"
#        #=> Encoding::CompatibilityError: incompatible encoding regexp match
#             (ISO-8859-1 regexp with UTF-8 string)
# 
# == Special global variables
# 
# Pattern matching sets some global variables :
# * <tt>$~</tt> is equivalent to Regexp.last_match;
# * <tt>$&</tt> contains the complete matched text;
# * <tt>$`</tt> contains string before match;
# * <tt>$'</tt> contains string after match;
# * <tt>$1</tt>, <tt>$2</tt> and so on contain text matching first, second, etc
#   capture group;
# * <tt>$+</tt> contains last capture group.
# 
# Example:
# 
#     m = /s(\w{2}).*(c)/.match('haystack') #=> #<MatchData "stac" 1:"ta" 2:"c">
#     $~                                    #=> #<MatchData "stac" 1:"ta" 2:"c">
#     Regexp.latch_match                    #=> #<MatchData "stac" 1:"ta" 2:"c">
# 
#     $&      #=> "stac"
#             # same as m[0]
#     $`      #=> "hay"
#             # same as m.pre_match
#     $'      #=> "k"
#             # same as m.post_match
#     $1      #=> "ta"
#             # same as m[1]
#     $2      #=> "c"
#             # same as m[2]
#     $3      #=> nil
#             # no third group in pattern
#     $+      #=> "c"
#             # same as m[-1]
# 
# These global variables are thread-local and method-local variables.
# 
# == Performance
# 
# Certain pathological combinations of constructs can lead to abysmally bad
# performance.
# 
# Consider a string of 25 <i>a</i>s, a <i>d</i>, 4 <i>a</i>s, and a
# <i>c</i>.
# 
#     s = 'a' * 25 + 'd' + 'a' * 4 + 'c'
#     #=> "aaaaaaaaaaaaaaaaaaaaaaaaadaaaac"
# 
# The following patterns match instantly as you would expect:
# 
#     /(b|a)/ =~ s #=> 0
#     /(b|a+)/ =~ s #=> 0
#     /(b|a+)*\/ =~ s #=> 0
# 
# However, the following pattern takes appreciably longer:
# 
#     /(b|a+)*c/ =~ s #=> 26
# 
# This happens because an atom in the regexp is quantified by both an
# immediate <tt>+</tt> and an enclosing <tt>*</tt> with nothing to
# differentiate which is in control of any particular character. The
# nondeterminism that results produces super-linear performance. (Consult
# <i>Mastering Regular Expressions</i> (3rd ed.), pp 222, by
# <i>Jeffery Friedl</i>, for an in-depth analysis). This particular case
# can be fixed by use of atomic grouping, which prevents the unnecessary
# backtracking:
# 
#     (start = Time.now) && /(b|a+)*c/ =~ s && (Time.now - start)
#        #=> 24.702736882
#     (start = Time.now) && /(?>b|a+)*c/ =~ s && (Time.now - start)
#        #=> 0.000166571
# 
# A similar case is typified by the following example, which takes
# approximately 60 seconds to execute for me:
# 
#     # Match a string of 29 <i>a</i>s against a pattern of 29 optional
#     # <i>a</i>s followed by 29 mandatory <i>a</i>s.
#     Regexp.new('a?' * 29 + 'a' * 29) =~ 'a' * 29
# 
# The 29 optional <i>a</i>s match the string, but this prevents the 29
# mandatory <i>a</i>s that follow from matching. Ruby must then backtrack
# repeatedly so as to satisfy as many of the optional matches as it can
# while still matching the mandatory 29. It is plain to us that none of the
# optional matches can succeed, but this fact unfortunately eludes Ruby.
# 
# The best way to improve performance is to significantly reduce the amount of
# backtracking needed.  For this case, instead of individually matching 29
# optional <i>a</i>s, a range of optional <i>a</i>s can be matched all at once
# with <i>a{0,29}</i>:
# 
#     Regexp.new('a{0,29}' + 'a' * 29) =~ 'a' * 29
class Regexp
    # see Regexp.options and Regexp.new   
    IGNORECASE = nil #value is unknown, used for indexing.
    # see Regexp.options and Regexp.new   
    EXTENDED = nil #value is unknown, used for indexing.
    # see Regexp.options and Regexp.new   
    MULTILINE = nil #value is unknown, used for indexing.
    # see Regexp.options and Regexp.new   
    FIXEDENCODING = nil #value is unknown, used for indexing.
    # see Regexp.options and Regexp.new   
    NOENCODING = nil #value is unknown, used for indexing.
    # Synonym for <code>Regexp.new</code>
    def self.compile(*args)
        #This is a stub, used for indexing
    end
    # Regexp.escape(str)   -> string
    # Regexp.quote(str)    -> string
    #  
    # Escapes any characters that would have special meaning in a regular
    # expression. Returns a new escaped string, or self if no characters are
    # escaped.  For any string,
    # <code>Regexp.new(Regexp.escape(<i>str</i>))=~<i>str</i></code> will be true.
    # 
    #    Regexp.escape('\*?{}.')   #=> \\\*\?\{\}\.
    def self.quote(str)
        #This is a stub, used for indexing
    end
    # Regexp.escape(str)   -> string
    # Regexp.quote(str)    -> string
    #  
    # Escapes any characters that would have special meaning in a regular
    # expression. Returns a new escaped string, or self if no characters are
    # escaped.  For any string,
    # <code>Regexp.new(Regexp.escape(<i>str</i>))=~<i>str</i></code> will be true.
    # 
    #    Regexp.escape('\*?{}.')   #=> \\\*\?\{\}\.
    def self.escape(str)
        #This is a stub, used for indexing
    end
    # Regexp.union(pat1, pat2, ...)            -> new_regexp
    # Regexp.union(pats_ary)                   -> new_regexp
    #  
    # Return a <code>Regexp</code> object that is the union of the given
    # <em>pattern</em>s, i.e., will match any of its parts. The <em>pattern</em>s
    # can be Regexp objects, in which case their options will be preserved, or
    # Strings. If no patterns are given, returns <code>/(?!)/</code>.
    # The behavior is unspecified if any given <em>pattern</em> contains capture.
    # 
    #    Regexp.union                         #=> /(?!)/
    #    Regexp.union("penzance")             #=> /penzance/
    #    Regexp.union("a+b*c")                #=> /a\+b\*c/
    #    Regexp.union("skiing", "sledding")   #=> /skiing|sledding/
    #    Regexp.union(["skiing", "sledding"]) #=> /skiing|sledding/
    #    Regexp.union(/dogs/, /cats/i)        #=> /(?-mix:dogs)|(?i-mx:cats)/
    def self.union(*several_variants)
        #This is a stub, used for indexing
    end
    # Regexp.last_match           -> matchdata
    # Regexp.last_match(n)        -> str
    #  
    # The first form returns the MatchData object generated by the
    # last successful pattern match.  Equivalent to reading the special global
    # variable <code>$~</code> (see Special global variables in Regexp for
    # details).
    # 
    # The second form returns the <i>n</i>th field in this MatchData object.
    # _n_ can be a string or symbol to reference a named capture.
    # 
    # Note that the last_match is local to the thread and method scope of the
    # method that did the pattern match.
    # 
    #    /c(.)t/ =~ 'cat'        #=> 0
    #    Regexp.last_match       #=> #<MatchData "cat" 1:"a">
    #    Regexp.last_match(0)    #=> "cat"
    #    Regexp.last_match(1)    #=> "a"
    #    Regexp.last_match(2)    #=> nil
    # 
    #    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ "var = val"
    #    Regexp.last_match       #=> #<MatchData "var = val" lhs:"var" rhs:"val">
    #    Regexp.last_match(:lhs) #=> "var"
    #    Regexp.last_match(:rhs) #=> "val"
    def self.last_match(*several_variants)
        #This is a stub, used for indexing
    end
    # Regexp.try_convert(obj) -> re or nil
    #  
    # Try to convert <i>obj</i> into a Regexp, using to_regexp method.
    # Returns converted regexp or nil if <i>obj</i> cannot be converted
    # for any reason.
    # 
    #    Regexp.try_convert(/re/)         #=> /re/
    #    Regexp.try_convert("re")         #=> nil
    # 
    #    o = Object.new
    #    Regexp.try_convert(o)            #=> nil
    #    def o.to_regexp() /foo/ end
    #    Regexp.try_convert(o)            #=> /foo/
    def self.try_convert(obj)
        #This is a stub, used for indexing
    end
    # Regexp.new(string, [options [, kcode]])        -> regexp
    # Regexp.new(regexp)                            -> regexp
    # Regexp.compile(string, [options [, kcode]])    -> regexp
    # Regexp.compile(regexp)                        -> regexp
    #  
    # Constructs a new regular expression from +pattern+, which can be either a
    # String or a Regexp (in which case that regexp's options are propagated),
    # and new options may not be specified (a change as of Ruby 1.8).
    # 
    # If +options+ is a Fixnum, it should be one or more of the constants
    # Regexp::EXTENDED, Regexp::IGNORECASE, and Regexp::MULTILINE,
    # <em>or</em>-ed together.  Otherwise, if +options+ is not
    # +nil+ or +false+, the regexp will be case insensitive.
    # 
    # When the +kcode+ parameter is `n' or `N' sets the regexp no encoding.
    # It means that the regexp is for binary strings.
    # 
    #   r1 = Regexp.new('^a-z+:\\s+\w+') #=> /^a-z+:\s+\w+/
    #   r2 = Regexp.new('cat', true)     #=> /cat/i
    #   r3 = Regexp.new(r2)              #=> /cat/i
    #   r4 = Regexp.new('dog', Regexp::EXTENDED | Regexp::IGNORECASE) #=> /dog/ix
    def self.new(*several_variants)
        #This is a stub, used for indexing
    end
    # rxp.hash   -> fixnum
    #  
    # Produce a hash based on the text and options of this regular expression.
    def hash()
        #This is a stub, used for indexing
    end
    # rxp == other_rxp      -> true or false
    # rxp.eql?(other_rxp)   -> true or false
    #  
    # Equality---Two regexps are equal if their patterns are identical, they have
    # the same character set code, and their <code>casefold?</code> values are the
    # same.
    # 
    #    /abc/  == /abc/x   #=> false
    #    /abc/  == /abc/i   #=> false
    #    /abc/  == /abc/u   #=> false
    #    /abc/u == /abc/n   #=> false
    def eql?(other_rxp)
        #This is a stub, used for indexing
    end
    # rxp == other_rxp      -> true or false
    # rxp.eql?(other_rxp)   -> true or false
    #  
    # Equality---Two regexps are equal if their patterns are identical, they have
    # the same character set code, and their <code>casefold?</code> values are the
    # same.
    # 
    #    /abc/  == /abc/x   #=> false
    #    /abc/  == /abc/i   #=> false
    #    /abc/  == /abc/u   #=> false
    #    /abc/u == /abc/n   #=> false
    def == other_rxp
        #This is a stub, used for indexing
    end
    # rxp =~ str    -> integer or nil
    #  
    # Match---Matches <i>rxp</i> against <i>str</i>.
    # 
    #    /at/ =~ "input data"   #=> 7
    #    /ax/ =~ "input data"   #=> nil
    # 
    # If <code>=~</code> is used with a regexp literal with named captures,
    # captured strings (or nil) is assigned to local variables named by
    # the capture names.
    # 
    #    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ "  x = y  "
    #    p lhs    #=> "x"
    #    p rhs    #=> "y"
    # 
    # If it is not matched, nil is assigned for the variables.
    # 
    #    /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/ =~ "  x = "
    #    p lhs    #=> nil
    #    p rhs    #=> nil
    # 
    # This assignment is implemented in the Ruby parser.
    # The parser detects 'regexp-literal =~ expression' for the assignment.
    # The regexp must be a literal without interpolation and placed at left hand side.
    # 
    # The assignment does not occur if the regexp is not a literal.
    # 
    #    re = /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/
    #    re =~ "  x = y  "
    #    p lhs    # undefined local variable
    #    p rhs    # undefined local variable
    # 
    # A regexp interpolation, <code>#{}</code>, also disables
    # the assignment.
    # 
    #    rhs_pat = /(?<rhs>\w+)/
    #    /(?<lhs>\w+)\s*=\s*#{rhs_pat}/ =~ "x = y"
    #    p lhs    # undefined local variable
    # 
    # The assignment does not occur if the regexp is placed at the right hand side.
    # 
    #   "  x = y  " =~ /(?<lhs>\w+)\s*=\s*(?<rhs>\w+)/
    #   p lhs, rhs # undefined local variable
    def =~ str
        #This is a stub, used for indexing
    end
    # rxp === str   -> true or false
    #  
    # Case Equality---Used in case statements.
    # 
    #    a = "HELLO"
    #    case a
    #    when /^[a-z]*$/; print "Lower case\n"
    #    when /^[A-Z]*$/; print "Upper case\n"
    #    else;            print "Mixed case\n"
    #    end
    #    #=> "Upper case"
    # 
    # Following a regular expression literal with the #=== operator allows you to
    # compare against a String.
    # 
    #     /^[a-z]*$/ === "HELLO" #=> false
    #     /^[A-Z]*$/ === "HELLO" #=> true
    def === str
        #This is a stub, used for indexing
    end
    # ~ rxp   -> integer or nil
    #  
    # Match---Matches <i>rxp</i> against the contents of <code>$_</code>.
    # Equivalent to <code><i>rxp</i> =~ $_</code>.
    # 
    #    $_ = "input data"
    #    ~ /at/   #=> 7
    def ~ rxp
        #This is a stub, used for indexing
    end
    # rxp.match(str)       -> matchdata or nil
    # rxp.match(str,pos)   -> matchdata or nil
    #  
    # Returns a <code>MatchData</code> object describing the match, or
    # <code>nil</code> if there was no match. This is equivalent to retrieving the
    # value of the special variable <code>$~</code> following a normal match.
    # If the second parameter is present, it specifies the position in the string
    # to begin the search.
    # 
    #    /(.)(.)(.)/.match("abc")[2]   #=> "b"
    #    /(.)(.)/.match("abc", 1)[2]   #=> "c"
    # 
    # If a block is given, invoke the block with MatchData if match succeed, so
    # that you can write
    # 
    #    pat.match(str) {|m| ...}
    # 
    # instead of
    # 
    #    if m = pat.match(str)
    #      ...
    #    end
    # 
    # The return value is a value from block execution in this case.
    def match(*several_variants)
        #This is a stub, used for indexing
    end
    # rxp.to_s   -> str
    #  
    # Returns a string containing the regular expression and its options (using the
    # <code>(?opts:source)</code> notation. This string can be fed back in to
    # <code>Regexp::new</code> to a regular expression with the same semantics as
    # the original. (However, <code>Regexp#==</code> may not return true when
    # comparing the two, as the source of the regular expression itself may
    # differ, as the example shows).  <code>Regexp#inspect</code> produces a
    # generally more readable version of <i>rxp</i>.
    # 
    #     r1 = /ab+c/ix           #=> /ab+c/ix
    #     s1 = r1.to_s            #=> "(?ix-m:ab+c)"
    #     r2 = Regexp.new(s1)     #=> /(?ix-m:ab+c)/
    #     r1 == r2                #=> false
    #     r1.source               #=> "ab+c"
    #     r2.source               #=> "(?ix-m:ab+c)"
    def to_s()
        #This is a stub, used for indexing
    end
    # rxp.inspect   -> string
    #  
    # Produce a nicely formatted string-version of _rxp_. Perhaps surprisingly,
    # <code>#inspect</code> actually produces the more natural version of
    # the string than <code>#to_s</code>.
    # 
    #      /ab+c/ix.inspect        #=> "/ab+c/ix"
    def inspect()
        #This is a stub, used for indexing
    end
    # rxp.source   -> str
    #  
    # Returns the original string of the pattern.
    # 
    #     /ab+c/ix.source #=> "ab+c"
    # 
    # Note that escape sequences are retained as is.
    # 
    #    /\x20\+/.source  #=> "\\x20\\+"
    def source()
        #This is a stub, used for indexing
    end
    # rxp.casefold?   -> true or false
    #  
    # Returns the value of the case-insensitive flag.
    # 
    #     /a/.casefold?           #=> false
    #     /a/i.casefold?          #=> true
    #     /(?i:a)/.casefold?      #=> false
    def casefold?()
        #This is a stub, used for indexing
    end
    # rxp.options   -> fixnum
    #  
    # Returns the set of bits corresponding to the options used when creating this
    # Regexp (see <code>Regexp::new</code> for details. Note that additional bits
    # may be set in the returned options: these are used internally by the regular
    # expression code. These extra bits are ignored if the options are passed to
    # <code>Regexp::new</code>.
    # 
    #    Regexp::IGNORECASE                  #=> 1
    #    Regexp::EXTENDED                    #=> 2
    #    Regexp::MULTILINE                   #=> 4
    # 
    #    /cat/.options                       #=> 0
    #    /cat/ix.options                     #=> 3
    #    Regexp.new('cat', true).options     #=> 1
    #    /\xa1\xa2/e.options                 #=> 16
    # 
    #    r = /cat/ix
    #    Regexp.new(r.source, r.options)     #=> /cat/ix
    def options()
        #This is a stub, used for indexing
    end
    # obj.encoding   -> encoding
    #  
    # Returns the Encoding object that represents the encoding of obj.
    def encoding()
        #This is a stub, used for indexing
    end
    # rxp.fixed_encoding?   -> true or false
    #  
    # Returns false if rxp is applicable to
    # a string with any ASCII compatible encoding.
    # Returns true otherwise.
    # 
    #     r = /a/
    #     r.fixed_encoding?                               #=> false
    #     r =~ "\u{6666} a"                               #=> 2
    #     r =~ "\xa1\xa2 a".force_encoding("euc-jp")      #=> 2
    #     r =~ "abc".force_encoding("euc-jp")             #=> 0
    # 
    #     r = /a/u
    #     r.fixed_encoding?                               #=> true
    #     r.encoding                                      #=> #<Encoding:UTF-8>
    #     r =~ "\u{6666} a"                               #=> 2
    #     r =~ "\xa1\xa2".force_encoding("euc-jp")        #=> ArgumentError
    #     r =~ "abc".force_encoding("euc-jp")             #=> 0
    # 
    #     r = /\u{6666}/
    #     r.fixed_encoding?                               #=> true
    #     r.encoding                                      #=> #<Encoding:UTF-8>
    #     r =~ "\u{6666} a"                               #=> 0
    #     r =~ "\xa1\xa2".force_encoding("euc-jp")        #=> ArgumentError
    #     r =~ "abc".force_encoding("euc-jp")             #=> nil
    def fixed_encoding?()
        #This is a stub, used for indexing
    end
    # rxp.names   -> [name1, name2, ...]
    #  
    # Returns a list of names of captures as an array of strings.
    # 
    #     /(?<foo>.)(?<bar>.)(?<baz>.)/.names
    #     #=> ["foo", "bar", "baz"]
    # 
    #     /(?<foo>.)(?<foo>.)/.names
    #     #=> ["foo"]
    # 
    #     /(.)(.)/.names
    #     #=> []
    def names()
        #This is a stub, used for indexing
    end
    # rxp.named_captures  -> hash
    #  
    # Returns a hash representing information about named captures of <i>rxp</i>.
    # 
    # A key of the hash is a name of the named captures.
    # A value of the hash is an array which is list of indexes of corresponding
    # named captures.
    # 
    #    /(?<foo>.)(?<bar>.)/.named_captures
    #    #=> {"foo"=>[1], "bar"=>[2]}
    # 
    #    /(?<foo>.)(?<foo>.)/.named_captures
    #    #=> {"foo"=>[1, 2]}
    # 
    # If there are no named captures, an empty hash is returned.
    # 
    #    /(.)(.)/.named_captures
    #    #=> {}
    def named_captures()
        #This is a stub, used for indexing
    end
end
