//
//  AppDelegate.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import AdSupport
import AppTrackingTransparency
import IQKeyboardManagerSwift
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    let bag = DisposeBag()
    
    var obs: PublishSubject<LocationModel?> = PublishSubject()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchViewController()
        getPushApple()
        getRootVc()
        keyboardManager()
        getfangdou()
        getLocation()
        //        getFontNames()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if #available(iOS 14.0, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var strToken = ""
        for byte in deviceToken {
            strToken += String(format: "%02x", byte)
        }
        print("strToken===\(strToken)")
        getTapToken(deviceToken: strToken)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }
    
    deinit {
        FCNotificationCenter.removeObserver(self)
    }
    
}

extension AppDelegate {
    
    func getFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("fontName>>>>>>>>>>>>>>\(fontName)")
            }
        }
    }
    
    func getLocation() {
        FCNotificationCenter.addObserver(self, selector: #selector(setUpLocation), name: NSNotification.Name(FCAPPLE_LOCATION), object: nil)
    }
    
    func getfangdou() {
        obs.debounce(.milliseconds(3000),scheduler: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] model in
                if let model = model {
                    self?.upLocationInfo(model)
                    print("locationModel>>>>>>>>\(model)")
                }
            }).disposed(by: bag)
    }
    
    func getTapToken(deviceToken: String) {
        let subject = DeviceInfo.getIdfv()
        let dict = ["subject": subject,
                    "shock": deviceToken]
        FCRequset.shared.requestAPI(params: dict, pageUrl: addedPlease, method: .post) { baseModel in
            let conceive = baseModel.conceive
            if conceive == 0 || conceive == 00 {
                print("push>>>>>success")
            }
        } errorBlock: { error in
            
        }
    }
    
    func upLocationInfo(_ model: LocationModel) {
        let country = model.country
        let city = model.city
        if country.isEmpty && city.isEmpty {
            self.uploadDeviceInfo()
        }else{
            self.uploadLocationInfo(model)
        }
    }
    
    func uploadLocationInfo(_ model: LocationModel) {
        let dict = ["financial": model.country ,
                    "bowed": model.countryCode,
                    "income": model.province,
                    "steady": model.city,
                    "inspire": "\(model.district) \(model.street)",
                    "needed": model.longitude,
                    "alcoholic": model.latitude] as [String: Any]
        FCRequset.shared.requestAPI(params: dict, pageUrl: morningReally, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            if conceive == 0 || conceive == 00 {
                self?.uploadDeviceInfo()
                print("uploadLocationInfo>>>>>>>success")
            }
        } errorBlock: { [weak self] error in
            self?.uploadDeviceInfo()
        }
    }
    
    func uploadDeviceInfo() {
        let dict = DeviceInfo.deviceInfo()
        if let base64String = dictToBase64(dict) {
            let dict = ["easily": base64String]
            FCRequset.shared.requestAPI(params: dict, pageUrl: thank, method: .post) { baseModel in
                let conceive = baseModel.conceive
                if conceive == 0 || conceive == 00 {
                    print("uploadDeviceInfo>>>>>>>success")
                }
            } errorBlock: { error in
                
            }
        }
    }
    
    func dictToBase64(_ dict: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            let base64EncodedString = jsonData.base64EncodedString()
            return base64EncodedString
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    func keyboardManager(){
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10.px()
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enable = true
    }
    
    func getRootVc() {
        FCNotificationCenter.addObserver(self, selector: #selector(setUpRootVc), name: NSNotification.Name(FCAPPLE_ROOT_VC), object: nil)
    }
    
    @objc func setUpRootVc() {
        window?.rootViewController = BaseNavViewController(rootViewController: HomeViewController())
    }
    
    @objc func getPushApple() {
        FCNotificationCenter.addObserver(self, selector: #selector(applePush(_ :)), name: NSNotification.Name(FCAPPLE_PUSH), object: nil)
    }
    
    @objc func setUpLocation() {
        LocationManager.shared.startUpdatingLocation { [weak self] locationModel in
            self?.obs.onNext(locationModel)
        }
    }
    
    @objc func applePush(_ notification: Notification) {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        }
        if #available(iOS 16.0, *) {
            center.setBadgeCount(0) { error in
                
            }
        } else {
            
        }
        UIApplication.shared.registerForRemoteNotifications()
    }
    
}
