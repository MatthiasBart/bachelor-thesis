extension NWBrowser.Result {
    var name: String? {
        if case let NWEndpoint.service(name: name, type: _, domain: _, interface: _) = self.endpoint {
            return name
        }
        return nil
    }
}