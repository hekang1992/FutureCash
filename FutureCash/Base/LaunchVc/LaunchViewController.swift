//
//  LaunchViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import Alamofire
import AppsFlyerLib
import AdSupport
import HandyJSON
import RxSwift

class LaunchViewController: FCBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        JudgNetWork()
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.image = UIImage(named: "launch")
        view.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    func JudgNetWork() {
        NetworkManager.shared.observeNetworkStatus { [weak self] status in
            switch status {
            case .none:
                print("无网络连接")
                break
            case .wifi:
                print("网络>>>>>>>WIFI")
                self?.upApiInfo()
                break
            case .cellular:
                print("网络>>>>>>>4G/5G")
                self?.upApiInfo()
                break
            }
        }
    }
    
    func upApiInfo() {
        getApplePush()
        getAppleLocation()
        getAppleGoogle()
        getRootVcPush()
    }
}

extension LaunchViewController {
    
    func getAppleGoogle() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_GOOGLE), object: nil)
    }
    
    func getApplePush() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_PUSH), object: nil)
    }
    
    func getAppleLocation() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_LOCATION), object: nil)
    }
    
}
