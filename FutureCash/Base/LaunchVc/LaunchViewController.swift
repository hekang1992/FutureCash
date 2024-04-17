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

class LaunchViewController: FCBaseViewController, AppsFlyerLibDelegate {
    
    
    
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
        uploadGoogleMarket()
        delayTime(0.5) { [weak self] in
            self?.getRootVcPush()
        }
    }
    
//    func getLocation() {
//        LocationManager.shared.startUpdatingLocation { locationModel in
//            self?.obs.onNext(locationModel)
//        }
//    }
    

    
}

extension LaunchViewController {
    
    func uploadGoogleMarket() {
        let idfv = DeviceInfo.getIdfv()
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        let dict = ["subject": idfv, "hesitated": idfa, "hints": "1"]
        FCRequset.shared.requestAPI(params: dict, pageUrl: ohBreakfast, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            if conceive == 0 || conceive == 00 {
                print("uploadGoogleMarket>>>>>>>success")
                let model = JSONDeserializer<GoogleModel>.deserializeFrom(dict: baseModel.easily)
                if let pistol = model?.pistol, let profession = model?.profession {
                    self?.uploadGoogle(profession, pistol)
                }
            }
        } errorBlock: { error in
            
        }
    }
    
    func uploadGoogle(_ key: String, _ appId: String) {
        AppsFlyerLib.shared().appsFlyerDevKey = key
        AppsFlyerLib.shared().appleAppID = appId
        AppsFlyerLib.shared().delegate = self
        AppsFlyerLib.shared().start()
    }
    
    func onConversionDataSuccess(_ conversionInfo: [AnyHashable : Any]) {
        print("conversionInfo>>>>>>>\(conversionInfo)")
    }
    
    func onConversionDataFail(_ error: any Error) {
        print("error>>>>>>>>\(error.localizedDescription)")
    }
    
    func getApplePush() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_PUSH), object: nil)
    }
    
    func getAppleLocation() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_LOCATION), object: nil)
    }
    
}
