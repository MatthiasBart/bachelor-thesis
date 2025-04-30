init(transportProtocol: TransportProtocol) throws {
    self.transportProtocol = transportProtocol
        
    listener = try NWListener(
        service: .init(
            name: UIDevice.current.name,
            type: transportProtocol.type,
            domain: nil
        ),
        using: transportProtocol.parameters
    )
}
    
func startAdvertising() {
    listener.newConnectionHandler = { [weak self] connection in
        self?.connection?.cancel()
        self?.connection = nil
        self?.connection = C(connection)
        self?.connectionStatus.value = "Connection established"
    }
        
    listener.stateUpdateHandler = { [weak self] state in
        self?.connectionStatus.value = "\(state)"
    }
        
    listener.start(queue: .global())
}
