let task0 = Task { @MainActor in
    for await nearbyPeers in service.nearbyPeersToInvite.values {
        state.nearbyPeersToInvite = nearbyPeers
    }
}
        
tasks.insert(task0)
