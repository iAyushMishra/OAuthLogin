//
//  TokenRepository.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 16/05/23.
//

import Foundation

protocol TokenRepository {
    func getToken() -> TokenBag?
    func setToken(tokenBag: TokenBag?) throws
    func resetToken() throws
}
