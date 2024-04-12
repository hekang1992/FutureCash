//
//  HomeViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import ViewAnimator
import MBProgressHUD

class HomeViewController: FCBaseViewController {
    
    lazy var loginView: LoginView = {
        let loginView = LoginView()
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let button = UIButton(type: .system)
        button.setTitle("Shake Me", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        loginView.block1 = { [weak self] in
            self?.loginView.removeFromSuperview()
        }
        loginView.block2 = { [weak self] in
            self?.loginInfo()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
