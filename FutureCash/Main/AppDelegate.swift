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
        getfagndou()
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
    
    func getfagndou() {
        obs.debounce(.milliseconds(3000),scheduler: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] model in
                if let model = model {
//                    self?.upLocationInfo(model)
                    print("locationModel>>>>>>>>\(model)")
                }
            }).disposed(by: bag)
    }
    
    func getLocation() {
        FCNotificationCenter.addObserver(self, selector: #selector(setUpLocation), name: NSNotification.Name(FCAPPLE_LOCATION), object: nil)
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
