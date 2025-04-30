var parameters: NWParameters {
    switch self {
    case .udp:
        let udpOptions = NWProtocolUDP.Options()
        let parameters = NWParameters(dtls: nil, udp: udpOptions)
        parameters.includePeerToPeer = true
        return parameters
            
    case .tcp:
        let tcpOptions = NWProtocolTCP.Options()
        tcpOptions.enableKeepalive = true
        tcpOptions.keepaliveIdle = 2
            
        let parameters = NWParameters(tls: nil, tcp: tcpOptions)
        parameters.includePeerToPeer = true
        return parameters
            
    case .quic:
                ...
    }
}
    
var type: String {
    switch self {
    case .udp:
        "_txtchat._udp"
    case .tcp:
        "_txtchat._tcp"
    case .quic:
        "_txtchatquic._udp"
    }
}
