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
        guard let url = oAuthService.getAuthPageUrl() else { return }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .fullScreen
        present(safariVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
