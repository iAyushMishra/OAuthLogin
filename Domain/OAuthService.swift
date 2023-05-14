//
//  OAuthService.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

/// Manages the flow of OAuth authentication flow
class OAuthService {
    
    /// Creates the necessary URLs for Authentication flow
    private let oauthClient: OAuthClient
    
    /// Randomly generated string passed during authentication flow
    private var state: String?

    init(oauthClient: OAuthClient) {
        self.oauthClient = oauthClient
    }

    /// Generates `URL` for authentication flow by generating value using `UUID`
    func getAuthPageUrl() -> URL? {
        state = UUID().uuidString
        return oauthClient.getAuthPageUrl(state: state!)
    }
}
