//
//  TLBaseViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import MBProgressHUD
import ViewAnimator
import HandyJSON

class FCBaseViewController: UIViewController {
    
    var totalTime = 60
    var countdownTimer: Timer!
    
    lazy var loginView: LoginView = {
        let loginView = LoginView()
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }
    
    func delayTime(_ delay: TimeInterval, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    func addLoginView() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        loginView.block1 = { [weak self] in
            self?.loginView.phoneTed.text = ""
            self?.loginView.codeView.deleteCodeStr()
            self?.loginView.removeFromSuperview()
        }
        loginView.block2 = { [weak self] in
            self?.loginInfo()
        }
        loginView.block3 = { [weak self] in
            self?.getCode()
        }
        self.animateLongView()
    }
    
    func animateLongView() {
        let animations = [AnimationType.from(direction: .right, offset: SCREEN_WIDTH)]
        UIView.animate(views: [loginView.bgImageView],
                       animations: animations,
                       initialAlpha: 0.5,
                       duration: 0.5)
    }
    
    func loginInfo() {
        let phoneStr = self.loginView.phoneTed.text ?? ""
        let codeStr = self.loginView.verifyCode
        if phoneStr.isEmpty {
            MBProgressHUD.show(text: "Please enter your phone number.")
        }else if codeStr.isEmpty {
            MBProgressHUD.show(text: "Please enter the verification code.")
        }else {
            self.walkedLogin()
        }
    }
    
    func getCode() {
        let phoneStr = self.loginView.phoneTed.text ?? ""
        if phoneStr.isEmpty {
            MBProgressHUD.show(text: "Please enter your phone number.")
        }else {
            self.horoughly(phoneStr)
        }
    }
    
    func startTimer() {
        self.loginView.btn2.isEnabled = false
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime > 0 {
            totalTime -= 1
            self.loginView.btn2.setTitle("\(self.totalTime)", for: .normal)
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        self.loginView.btn2.isEnabled = true
        self.loginView.btn2.setTitle("Send", for: .normal)
        totalTime = 60
    }
    
    func getRootVcPush() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_ROOT_VC), object: nil)
    }
    
}

extension FCBaseViewController {
    
    //验证码
    func horoughly(_ phone: String) {
        let dict = ["judge": phone, "killing": "1"]
        FCRequset.shared.requestAPI(params: dict, pageUrl: rightThoroughly, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            MBProgressHUD.show(text: wanting)
            if conceive == 0 || conceive == 00 {
                self?.startTimer()
            }
        } errorBlock: { error in
            
        }
    }
    
    //登陆
    func walkedLogin() {
        let phoneStr = self.loginView.phoneTed.text ?? ""
        let codeStr = self.loginView.verifyCode
        let dict = ["temperance": phoneStr, "females": codeStr, "suggest": "1"]
        FCRequset.shared.requestAPI(params: dict, pageUrl: walkedWhole, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            MBProgressHUD.show(text: wanting)
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<LoginModel>.deserializeFrom(dict: baseModel.easily)
                guard let model = model else { return }
                LoginFactory.saveLoginInfo(model.temperance ?? "", model.temple ?? "")
                self?.getRootVcPush()
            }
        } errorBlock: { error in
            
        }
    }

}
