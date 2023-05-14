//
//  DeeplinkHandler.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

/// Handles incoming deeplink
class DeepLinkHandler {
    typealias DeeplinkCallback = (DeepLink) -> Void
    
    /// Maps each supported `DeepLink` to a corresponding callback `DeeplinkCallback`.
    var callbackMap: [DeepLink: DeeplinkCallback] = [:]
    
    /// Used to add a callback function for a particular `DeepLink`
    func addCallback(_ callback: @escaping DeeplinkCallback, forDeepLink deepLink: DeepLink) {
        callbackMap[deepLink] = callback
    }
    
    /// Method takes a `DeepLink` instance and looks up its corresponding callback function in the callbackMap.
    /// If a callback function is found, it is called with the deep link as its argument.
    func handleDeepLinkIfPossible(deepLink: DeepLink) {
        guard let callback = callbackMap[deepLink] else { return  }
        
        callback(deepLink)
    }
}
