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
        addLoginView()
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
