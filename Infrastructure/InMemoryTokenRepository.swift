//
//  InMemoryTokenRepository.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 16/05/23.
//

import Foundation

class InMemoryTokenRepository: TokenRepository {
    private var tokenBag: TokenBag?
    
    func getToken() -> TokenBag? { tokenBag }
    
    func setToken(tokenBag: TokenBag?) throws { self.tokenBag = tokenBag }
    
    func resetToken() throws { tokenBag = nil }
}
