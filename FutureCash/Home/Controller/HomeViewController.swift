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
    
    lazy var rightView: RightView = {
        let rightView = RightView()
        return rightView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
        button.setTitle("login", for: .normal)
        button.backgroundColor = .randomColor()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        let button1 = UIButton(type: .custom)
        button1.frame = CGRect(x: 200, y: 500, width: 100, height: 100)
        button1.setTitle("right", for: .normal)
        button1.backgroundColor = .randomColor()
        button1.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        view.addSubview(button1)
    }
    
    @objc func buttonTapped() {
        addLoginView()
    }
    
    @objc func buttonTapped1() {
        view.addSubview(rightView)
        rightView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        self.animateLongView()
    }
    
    override func animateLongView() {
        let animations = [AnimationType.from(direction: .right, offset: SCREEN_WIDTH)]
        UIView.animate(views: [rightView],
                       animations: animations,
                       initialAlpha: 0.5,
                       duration: 0.5)
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
