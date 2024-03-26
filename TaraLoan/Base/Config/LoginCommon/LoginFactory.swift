//
//  LoginFactory.swift
//  TaraLoan
//
//  Created by apple on 2024/3/25.
//

import UIKit
import SystemServices

class LoginFactory: NSObject {
    
    static func getLoginParas() -> String{
        let shoot: String = "iOS"
        let pursed: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let fingerprints: String = SystemServices().deviceModel ?? ""
        let routine: String = DeviceInfo.getIdfv()
        let pitched: String = SystemServices().systemsVersion ?? ""
        let pistol: String = "liliy"
        let temple: String = "sessionId"
        let below: String = DeviceInfo.getIdfv()
        let change: String = "change"
        let lastUrl: String = "shoot=\(shoot)&pursed=\(pursed)&fingerprints=\(fingerprints)&routine=\(routine)&pitched=\(pitched)&pistol=\(pistol)&temple=\(temple)&below=\(below)&change=\(change)"
        return lastUrl
    }
    
}