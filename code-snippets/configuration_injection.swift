init(state: State = .init(), servers: [any Server] = Config.servers) {
    self.state = state
    self.servers = servers
}