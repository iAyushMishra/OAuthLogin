//
//  LocalOauthClient.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

/// This class generates the local `URL` for `OAuth` login page.
class LocalOauthClient: OAuthClient {
    /**
    Constructs the `URL` string with provided state value.

    - Parameter state: A string to encode any other information in it.

    - Returns: An `URL` object
    */
    func getAuthPageUrl(state: String) -> URL? {
        let urlString = "https://github.com/login/oauth/authorize?client_id=68a74ed2695985b220f9&redirect_uri=com.ayush.OAuthLogin://authentication&s&scopes=repo,user&state=\(state)"

        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL from string: \(urlString)")
        }

        return url
    }
}
