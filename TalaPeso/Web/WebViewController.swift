//
//  WebViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import WebKit
import StoreKit

class WebViewController: FCBaseViewController {
    
    var url: String?
    
    var type: String?
    
    lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let userContentController = WKUserContentController()
        let scriptNames = ["matterGovernment", "momentaryHenry", "loweredRestored", "mightNearer", "somethingSolid", "thereRelative", "theSomething", "sisters", "upsetAgain"]
        for scriptName in scriptNames {
            userContentController.add(self, name: scriptName)
        }
        configuration.userContentController = userContentController
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.bounces = false
        webView.scrollView.alwaysBounceVertical = false
        webView.navigationDelegate = self
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.title), options: .new, context: nil)
        return webView
    }()
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(frame: .zero)
        progressView.tintColor = UIColor(css: "#384067")
        progressView.trackTintColor = UIColor.groupTableViewBackground
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            if let canGoBack = self?.webView.canGoBack, canGoBack {
                self?.webView.goBack()
            }else {
                if self?.type == "bankwallet" {
                    self?.navigationController?.popToRootViewController(animated: true)
                }else {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
        addWebVcView()
        if let url = URL(string: url ?? "") {
            webView.load(URLRequest(url: url))
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.title))
    }
}

extension WebViewController: WKNavigationDelegate, WKScriptMessageHandler {
    
    func addWebVcView() {
        view.insertSubview(webView, belowSubview: navView)
        webView.addSubview(progressView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        progressView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(2.px())
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            if let progress = change?[.newKey] as? CGFloat {
                self.progressView.progress = Float(progress)
                if progress >= 1.0 {
                    UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
                        self.progressView.alpha = 0
                    }, completion: nil)
                }
            }
        } else if keyPath == #keyPath(WKWebView.title) {
            if let newTitle = change?[.newKey] as? String {
                DispatchQueue.main.async { [weak self] in
                    self?.navView.titleLable.text = newTitle
                }
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        let loadView = ViewHud.createLoadView()
        if let keyWindow = UIApplication.shared.windows.first {
            keyWindow.addSubview(loadView)
        }
        delayTime(60) {
            ViewHud.hideLoadView()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ViewHud.hideLoadView()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        ViewHud.hideLoadView()
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let body = message.body as? [String] else {
            print("Invalid message body")
            return
        }
        let methodName = message.name
        let methodArgs = body
        let methodMapping: [String: () -> Void] = [
            "matterGovernment": { self.uploadRiskLoan(methodArgs) },
            "momentaryHenry": { self.openUrl(methodArgs) },
            "loweredRestored": { self.closeSyn() },
            "mightNearer": { self.jumpToHome() },
            "somethingSolid": { self.callPhoneMethod(methodArgs) },
            "thereRelative": { self.setNavExpansion(methodArgs) },
            "theSomething": { self.setNavColor(methodArgs) },
            "sisters": { self.jumpToEmail(methodArgs) },
            "upsetAgain": { self.toGrade() }
        ]
        if let method = methodMapping[methodName] {
            method()
        } else {
            print("Unknown method: \(methodName)")
        }
    }
    
    func uploadRiskLoan(_ arguments: [String]) {
        guard arguments.count >= 2 else { return }
        let productId = arguments[0]
        let startTime = arguments[1]
        self.miandian(productID: productId, startTime: startTime, type: "10")
    }
    
    func openUrl(_ arguments: [String]) {
        guard let path = arguments.first else { return }
        judguUrlContainSche(path)
    }
    
    func closeSyn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func jumpToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func callPhoneMethod(_ arguments: [String]) {
        if let phone = arguments.first {
            let phoneStr = "telprompt://\(phone)"
            if let phoneURL = URL(string: phoneStr), UIApplication.shared.canOpenURL(phoneURL) {
                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    func setNavExpansion(_ arguments: [String]) {
        let type = arguments.first!
        if type == "1" {//hide
            webView.snp.updateConstraints { make in
                make.edges.equalToSuperview()
            }
        }else {
            webView.snp.updateConstraints { make in
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: CGFloat(NAV_HIGH), left: 0, bottom: 0, right: 0))
            }
        }
    }
    
    func setNavColor(_ arguments: [String]) {
        
    }
    
    func jumpToEmail(_ arguments: [String]) {
        let email = arguments.first ?? ""
        let subject = arguments[1]
        let orderID = arguments.last ?? ""
        let mobileStr = UserDefaults.standard.object(forKey: PHONE_LOGIN)
        var strBody = "Tala Peso Account: \(mobileStr ?? "")"
        if !orderID.isEmpty {
            strBody += ", orderId: \(orderID)"
        }
        let mailtoString = "mailto:\(email)?subject=\(subject)&body=\(strBody)"
        if let encodedUrlString = mailtoString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let mailtoUrl = URL(string: encodedUrlString) {
            if UIApplication.shared.canOpenURL(mailtoUrl) {
                UIApplication.shared.open(mailtoUrl, options: [:], completionHandler: nil)
            } else {
                print("Can't open email client")
            }
        } else {
            print("Invalid mailto URL")
        }
    }
    
    func toGrade() {
        if #available(iOS 14.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene  {
                SKStoreReviewController.requestReview(in: scene)
            }
        } else {
            SKStoreReviewController.requestReview()
        }
    }
}
