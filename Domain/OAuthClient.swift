//
//  OAuthClient.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

/// This protocol helps any concrete type to handle OAuth authetication process
protocol OAuthClient {
    /**
    Helps to return AuthenticationURL i.e.
    endpoint for the API provider authorization server, to retrieve the auth code.

    - Parameter state: A string to encode any information in it, holds randomly generated `UUID`.

    - Returns: An AuthenticationPageURL
    */
    func getAuthPageUrl(state: String) -> URL?
}
