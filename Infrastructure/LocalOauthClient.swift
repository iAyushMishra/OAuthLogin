//
//  LocalOauthClient.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

/// This class generates the local `URL` for `OAuth` login page.
class LocalOauthClient: OAuthClient {
    
    /// Unique ID for application that is requesting authentication.
    /// This ID is obtained when registering the application with the OAuth provider(Github).
    private let clientID = "68a74ed2695985b220f9"
    
    /// URI where the OAuth provider(Github) will redirect the user after they have authorized the application.
//    private let redirectURI = "com.ayush.OAuthLogin://authentication"
    private let redirectURI = "it.iacopo.github://authentication"
    /**
     Constructs the `URL` string with provided state value.
     
     - Parameter state: A string to encode any other information in it.
                        An unguessable random string.
                        It is used to protect against cross-site request forgery attacks.
     
     - Returns: An `URL` object
     */
    func getAuthPageUrl(state: String) -> URL? {
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(clientID)&redirect_uri=\(redirectURI)&s&scopes=repo,user&state=\(state)"

        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL from string: \(urlString)")
        }

        return url
    }
    
    /// Mock implementation of a method that would exchange an authorization code
    /// for an access token in a OAuth authentication flow.
    func exchangeCodeForToken(code: String,
                              state: String,
                              completion: @escaping (Result<TokenBag, Error>) -> Void) {
        completion(.success(TokenBag(accessToken: "anAccessToken")))
    }
}
