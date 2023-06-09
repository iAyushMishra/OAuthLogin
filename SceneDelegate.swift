//
//  SceneDelegate.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 13/05/23.
//

import UIKit
import OAuthSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let dependencyContainer = AppDependencyContainer()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        /// Setting up Initial view controller
        let mainVC = dependencyContainer.makeMainViewController()
        self.window = window
        window.frame = UIScreen.main.bounds
        window.rootViewController = mainVC
        window.makeKeyAndVisible()
    }
    
    // Notifies when app is in foreground and interacts to custom URL schema.
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let urlContext = URLContexts.first {
            let url = urlContext.url
            if let deepLink = DeepLink(url: url) {
                dependencyContainer.deepLinkHandler.handleDeepLinkIfPossible(deepLink: deepLink)
            }
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
