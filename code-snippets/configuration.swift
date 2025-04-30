struct Config {
    static let serviceProtocols: [TransportProtocol] = [.udp, .tcp, .quic]
    
    static var clients: [any Client] {
        serviceProtocols.map { ClientImpl<ConnectionImpl>(transportProtocol: $0) }
    }
    
    static var servers: [any Server] {
       serviceProtocols.compactMap { try? ServerImpl<ConnectionImpl>(transportProtocol: $0) }
    }
}