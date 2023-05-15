//
//  Deeplink.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import Foundation

let scheme = "com.ayush.OAuthLogin"

/// Represents Deeplink in the app  for the OAuth flow.
enum DeepLink: Hashable {
    case oAuth(URL)
    
    init?(url: URL) {
        /// If authentication scheme and URL matches,
        /// the initializer returns an instance of the `DeepLink` enum with the .oAuth case.
        let authLinkToDeepLink: (URL) -> DeepLink = { .oAuth($0) }
        
        /// Maps specific URLScheme and path to closure that converts URL to `DeepLink` enum.
        /// Converts incoming URLs to DeepLink values.
        let deepLinkMap: [String: (URL) -> DeepLink] = [
            "\(scheme)://authentication": authLinkToDeepLink
        ]
        
        let deepLink = deepLinkMap.first(where: { url.absoluteString.hasPrefix($0.key) })?.value
        
        switch deepLink {
        case .some(let urlToDeepLink):
                print("Deeplink Success")
            self = urlToDeepLink(url)
        default:
            return nil
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .oAuth:
            return hasher.combine(1)
        }
    }
    
    static func ==(lhs: DeepLink, rhs: DeepLink) -> Bool {
      return lhs.hashValue == rhs.hashValue
    }
}
