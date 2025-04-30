sec_protocol_options_set_verify_block(quicOptions.securityProtocolOptions, { _, sec_trust, completion in
    ... //check validity of sec_trust
    completion(isTrusting)
}, .global())