=begin
 This is a machine generated stub using stdlib-doc for <b>class SOCKSSocket</b>
 Sources used:  Ruby 1.9.3-p429
 Created on 2013-07-25 12:27:51 +0400 by IntelliJ Ruby Stubs Generator.
=end

require 'tcp_socket'
# SOCKS is an Internet protocol that routes packets between a client and
# a server through a proxy server.  SOCKS5, if supported, additionally
# provides authentication so only authorized users may access a server.
class SOCKSSocket < TCPSocket
    # SOCKSSocket.new(host, serv) => socket
    #  
    # Opens a SOCKS connection to +host+ via the SOCKS server +serv+.
    def self.new(host, serv)
        #This is a stub, used for indexing
    end
    # Closes the SOCKS connection.
    def close()
        #This is a stub, used for indexing
    end
end
