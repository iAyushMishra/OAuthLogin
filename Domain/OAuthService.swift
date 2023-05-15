//
//  OAuthService.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

/// Manages the flow of OAuth authentication flow
class OAuthService {
    
    // MARK: - Private Attributes
    
    /// Creates the necessary URLs for Authentication flow
    private let oauthClient: OAuthClient
    
    /// Randomly generated string passed during authentication flow
    private var state: String?
    private let tokenRepository: TokenRepository
    
    var onAuthenticationResult: ((Result<TokenBag, Error>) -> Void)?
    
    // MARK: - Initialization
    
    init(oauthClient: OAuthClient, tokenRepository: TokenRepository) {
        self.oauthClient = oauthClient
        self.tokenRepository = tokenRepository
    }
    
    // MARK: - Internal Methods
    
    /// Generates `URL` for authentication flow by generating value using `UUID`
    func getAuthPageUrl(state: String = UUID().uuidString) -> URL? {
        self.state = state
        return oauthClient.getAuthPageUrl(state: state)
    }
    
    /// Method to extract data from the URL and perform the code exchange
    func exchangeCodeForToken(url: URL) {
        guard let state = state, let code = getCodeFromUrl(url: url) else {
            onAuthenticationResult?(.failure(OAuthError.malformedLink))
            return
        }
        
        oauthClient.exchangeCodeForToken(code: code, state: state) { [weak self] result in
            switch result {
            case .success(let tokenBag):
                try? self?.tokenRepository.setToken(tokenBag: tokenBag)
                self?.onAuthenticationResult?(.success(tokenBag))
            case .failure:
                self?.onAuthenticationResult?(.failure(OAuthError.exchangeFailed))
            }
        }
    }
}

//MARK: - Private Methods
private extension OAuthService {
    func getCodeFromUrl(url: URL) -> String? {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let code = components?.queryItems?.first(where: { $0.name == "code" })?.value
        let state = components?.queryItems?.first(where: { $0.name == "state" })?.value
        
        if let code = code, let state = state, state == self.state {
            return code
        } else {
            return nil
        }
    }
}
