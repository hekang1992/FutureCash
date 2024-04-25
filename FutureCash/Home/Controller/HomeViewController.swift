//
//  HomeViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension HomeViewController {
    
    @objc func buttonTapped() {
        addLoginView()
    }
    
    @objc func buttonTapped1() {
        view.addSubview(rightView)
        rightView.block1 = { [weak self] in
            self?.hideRightView()
        }
        rightView.block2 = { [weak self] in
            self?.goSetVc()
        }
        rightView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        delayTime(0.1) { [weak self] in
            self?.animateRightView()
        }
    }
    
    func animateRightView() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.1,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.2,
                       options: .curveLinear) {
            self.rightView.alpha = 1
            self.rightView.bgView.alpha = 1
            self.rightView.bgImageView1.alpha = 1
            self.rightView.bgImageView.snp.updateConstraints { make in
                make.left.equalTo(self.rightView).offset(75.px())
            }
            self.rightView.layoutSubviews()
        }
    }
    
    func hideRightView() {
        UIView.animate(withDuration: 0.25) {
            self.rightView.alpha = 0
            self.rightView.bgView.alpha = 0
            self.rightView.bgImageView1.alpha = 0
            self.rightView.bgImageView.snp.updateConstraints { make in
                make.left.equalTo(self.rightView).offset(SCREEN_WIDTH)
            }
            self.rightView.layoutSubviews()
        }
    }
    
    func goSetVc() {
        let setVc = ProfileViewController()
        self.navigationController?.pushViewController(setVc, animated: true)
    }
}
