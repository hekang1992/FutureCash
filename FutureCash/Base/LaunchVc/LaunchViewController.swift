//
//  LaunchViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import Alamofire
import AppsFlyerLib

class LaunchViewController: FCBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        JudgNetWork()
    }
    
    //判断网络
    func JudgNetWork() {
        NetworkManager.shared.observeNetworkStatus { [weak self] status in
            switch status {
            case .none:
                print("无网络连接")
                break
            case .wifi:
                print("网络>>>>>>>WIFI")
                self?.uploadDeviceInfo()
                self?.uploadGoogleMarket()
                break
            case .cellular:
                print("网络>>>>>>>4G/5G")
                self?.uploadDeviceInfo()
                self?.uploadGoogleMarket()
                break
            }
        }
    }
    
    func uploadDeviceInfo() {
        getApplePush()
    }
    
    func uploadGoogleMarket() {
        
    }
    
    func uploadGoogle(_ key: String, _ appId: String) {
        AppsFlyerLib.shared().appsFlyerDevKey = key
        AppsFlyerLib.shared().appleAppID = appId
        AppsFlyerLib.shared().start()
    }
    
    func getApplePush() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_PUSH), object: nil)
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
