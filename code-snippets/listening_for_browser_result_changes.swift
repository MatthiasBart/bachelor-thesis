Task { @MainActor in
    for await browseResults in client.browserResults.values {
        state.advertiserNames.append(contentsOf: browseResults.compactMap { $0.name })
        state.advertiserNames = state.advertiserNames.removingDuplicates()
    }
}
