//
//  OAuthError.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

/// Custom error for handling OAuthError
enum OAuthError: Error {
    case malformedLink
    case exchangeFailed
}
