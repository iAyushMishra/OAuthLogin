//
//  OAuthConfig.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

struct OAuthConfig {
    let authorizationUrl: URL
    let tokenUrl: URL
    let clientId: String
    let clientSecret: String
    let redirectUri: URL
    let scopes: [String]
}
