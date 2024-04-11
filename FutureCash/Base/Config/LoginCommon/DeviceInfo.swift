//
//  DeviceInfo.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import AdSupport
import DeviceKit
import SAMKeychain
import CoreTelephony
import SystemServices
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork

class DeviceInfo: NSObject {
    
    static func getIdfv() -> String {
        if let uuid = SAMKeychain.password(forService: Key_Service, account: Key_Account), !uuid.isEmpty {
            return uuid
        } else {
            if let deviceIDFV = UIDevice.current.identifierForVendor?.uuidString {
                let success = SAMKeychain.setPassword(deviceIDFV, forService: Key_Service, account: Key_Account)
                if success {
                    print("获取的UUID is \(deviceIDFV)")
                    return deviceIDFV
                } else {
                    return ""
                }
            } else {
                return ""
            }
        }
    }
    
    static func isUsingProxy() -> Bool {
        let configuration = URLSessionConfiguration.default
        if let proxySettings = configuration.connectionProxyDictionary {
            return proxySettings.count > 0
        }
        return false
    }
    
    static func isVPNConnected() -> Bool {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sa_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return isReachable && !needsConnection
    }
    
    static func getNetType() -> String {
        let frank: String = NetworkManager.shared.typeSty
        return frank
    }
    
    static func getProTime() -> String {
        let time: TimeInterval = ProcessInfo.processInfo.systemUptime
        let timeDate = Date(timeIntervalSinceNow: 0 - time)
        let timeSp = String(format: "%ld", Int(timeDate.timeIntervalSince1970))
        return timeSp
    }
    
    static func getCurrentTime() -> String {
        let currentTimeStamp = Date().timeIntervalSince1970
        let currentTimeMillis = String(currentTimeStamp * 1000)
        return currentTimeMillis
    }
    
    static func telegram() -> String {
        let telegram = String.init(format: "%.0f",SCREEN_WIDTH)
        return telegram
    }
    
    static func train() -> String {
        let train = String.init(format: "%.0f",SCREEN_HEIGHT)
        return train
    }
    
    static func impossible() -> String {
        let freeDisk: CLongLong = SystemServices.shared().longFreeDiskSpace
        let patience = String(format: "%.2lld", freeDisk)
        return patience
    }
    
    static func nearly() -> String {
        let allDisk: CLongLong = SystemServices.shared().longDiskSpace
        let lists = String(format: "%.2lld", allDisk)
        return lists
    }
    
    static func mademoiselle() -> String {
        let allmem: Double = SystemServices.shared().totalMemory
        let disposed = String(format: "%.0f", allmem * 1024 * 1024)
        return disposed
    }
    
    static func alternative() -> String {
        let freemem: Double = SystemServices.shared().freeMemoryinRaw
        let minute = String(format: "%.0f", freemem * 1024 * 1024)
        return minute
    }
    
    static func isJailBreak() -> String {
        let jailbreakToolPaths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt"
        ]
        for path in jailbreakToolPaths {
            if FileManager.default.fileExists(atPath: path) {
                return "1"
            }
        }
        return "0"
    }
    
    static func deviceInfo() -> [String: Any] {
        let irishman = SystemServices().systemsVersion ?? ""
        let acidly = getProTime()
        let replied = Bundle.main.bundleIdentifier ?? ""
        let foolishly = SystemServices().batteryLevel
        let advice = SystemServices().charging
        let subject = DeviceInfo.getIdfv()
        let hesitated = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        let savings = SSNetworkInfo.wiFiBroadcastAddress() ?? ""
        let rotter = getCurrentTime()
        let daresay = isUsingProxy() ? "1" : "0"
        let weeks = isVPNConnected() ? "1" : "0"
        let believe = isJailBreak()
        let is_simulator = Device.current.isSimulator ? "1" : "0"
        let clerk = SystemServices().language ?? ""
        let insurance = SystemServices().carrierName ?? ""
        let frank = getNetType()
        let misunderstand = SystemServices().timeZoneSS ?? ""
        let truant = getCurrentTime()
        let hurriedly = Device.current.name ?? ""
        let early = Device.current.description
        let reliable = Device.current.model ?? ""
        let years = Device.current.diagonal
        let working = Device.current.systemVersion ?? ""
        let instruments = SSNetworkInfo.currentIPAddress() ?? ""
        let employment = SSNetworkInfo.wiFiNetmaskAddress() ?? ""
        let charts = SSNetworkInfo.wiFiBroadcastAddress() ?? ""
        let filed = SSNetworkInfo.wiFiNetmaskAddress() ?? ""
        let impossible = impossible()
        let nearly = nearly()
        let mademoiselle = mademoiselle()
        let alternative = alternative()
       
        var dict: [String: Any] = ["irishmen":"iOS","irishman":irishman,"acidly":acidly,"replied":replied]
        
        dict["devoted"] = ["foolishly":foolishly,"advice":advice]
        
        dict["persuade"] = ["subject":subject,"hesitated":hesitated,"savings":savings,"rotter":rotter,"daresay":daresay,"weeks":weeks,"believe":believe,"is_simulator":is_simulator,"clerk":clerk,"insurance":insurance,"frank":frank,"misunderstand":misunderstand,"truant":truant]
        
        dict["unfeeling"] = ["mustn":"","hurriedly":hurriedly,"hesitation":"","train":train(),"telegram":telegram(),"early":early,"reliable":reliable,"years":years,"working":working]
        
        let wifiInfo: [String: Any] = ["employment":employment,"charts":charts,"savings":savings,"filed":filed]
        
        
        dict["handed"] = ["instruments":instruments,"assistant":"0","correspondence":wifiInfo]
        
        dict["annoyed"] = ["impossible":impossible,"nearly":nearly,"mademoiselle":mademoiselle,"alternative":alternative]
        
        return dict
    }
}
