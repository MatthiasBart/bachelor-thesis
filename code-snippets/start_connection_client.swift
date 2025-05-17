func createConnection(with browserResult: NWBrowser.Result) -> Error? {
    let nwConnection = NWConnection(
        to: browserResult.endpoint,
        using: transportProtocol.parameters
    )
        
    self.connection?.cancel()
    self.connection = nil
    self.connection = C(nwConnection)
        
    if case let .failed(error) = self.connection?.state {
        return error
    }
    return nil
}
