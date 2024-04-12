//
//  TLBaseViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import MBProgressHUD
import ViewAnimator

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
        MBProgressHUD.show(text: "login success")
    }
    
    func getCode() {
        self.startTimer()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
