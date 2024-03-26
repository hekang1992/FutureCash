//
//  NetworkManager.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import Alamofire
import Reachability

class NetworkManager {
    
    enum NetworkStatus {
        case wifi
        case cellular
        case none
    }
    
    static let shared = NetworkManager()
    
    private let reachability = try!Reachability()
    
    typealias NetworkStatusHandler = (NetworkStatus) -> Void
    
    private var networkStatusHandler: NetworkStatusHandler?
    
    private init() {
        setupReachability()
    }
    
    private func setupReachability() {
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("无法开始网络状态监测")
        }
    }
    
    deinit {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
    }
    
    @objc func networkStatusChanged() -> String {
        if reachability.connection != .unavailable {
            if reachability.connection == .wifi {
                notifyNetworkStatus(.wifi)
                return "WIFI"
            } else {
                notifyNetworkStatus(.cellular)
                return "4G/5G"
            }
        } else {
            notifyNetworkStatus(.none)
            return "Unknown Network"
        }
    }
    
    func observeNetworkStatus(_ handler: @escaping NetworkStatusHandler) {
        networkStatusHandler = handler
    }
    
    private func notifyNetworkStatus(_ status: NetworkStatus) {
        networkStatusHandler?(status)
    }
    
}
