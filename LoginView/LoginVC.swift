//
//  LoginVC.swift
//  OAuthLogin
//
//  Created by Ayush Mishra on 14/05/23.
//

import UIKit
import SafariServices

class LoginVC: UIViewController {
    // MARK: - Private Variables
    private let oAuthService: OAuthService
    
    // MARK: - Initialization
    init(oAuthService: OAuthService) {
        self.oAuthService = oAuthService
        super.init(nibName: "LoginView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IBActions
    @IBAction private func btnLoginClicked(_ sender: UIButton) {
        guard let url = oAuthService.getAuthPageUrl(state: "state") else { return }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .fullScreen
        present(safariVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        oAuthService.onAuthenticationResult = { [weak self] in self?.onAuthenticationResult(result: $0) }
    }
    
    // MARK: - Methods
    func onAuthenticationResult(result: Result<TokenBag, Error>) {
        DispatchQueue.main.async {
            self.presentedViewController?.dismiss(animated: true) {
                switch result {
                    case .success(let tokenBag):
                        let alert = UIAlertController(title: "Token",
                                                      message: tokenBag.accessToken,
                                                      preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    case .failure:
                        let alert = UIAlertController(title: "Something went wrong :(",
                                                      message: "Authentication error",
                                                      preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                        self.present(alert, animated: true)
                }
            }
        }
    }
}
