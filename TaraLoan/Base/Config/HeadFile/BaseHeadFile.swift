//
//  BaseHeadFile.swift
//  TaraLoan
//
//  Created by apple on 2024/3/25.
//

import Foundation
import Alamofire
import Kingfisher
import MBProgressHUD_WJExtension
import MJRefresh
import SnapKit
import RxSwift
import SAMKeychain
import TYAlertController
import BRPickerView
import HandyJSON
import IQKeyboardManagerSwift
import AppsFlyerLib
import AAILivenessSDK
import SystemServices
import SystemConfiguration
import AdSupport
import CoreTelephony
import SystemConfiguration.CaptiveNetwork
import UIColor_Hex

//DEFINE
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
// 状态栏高度
let STATUSBAR_HIGH = IS_iPhoneXSeries() ? 44 : 20
// 导航栏高度
let NAV_HIGH = 44 + STATUSBAR_HIGH;

func IS_iPhoneXSeries() -> (Bool) {
    let boundsSize = UIScreen.main.bounds.size;
    // iPhoneX,XS
    let x_xs = CGSize(width: 375, height: 812);
    if (__CGSizeEqualToSize(boundsSize, x_xs)) {
        return true
    }
    // iPhoneXS Max,XR
    let xsmax_xr = CGSize(width: 414, height: 896);
    if (__CGSizeEqualToSize(boundsSize, xsmax_xr)) {
        return true
    }
    return false
}

extension UIColor {
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UILabel {
    static func createLabel(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.backgroundColor = UIColor.clear
        return label
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}

extension Double {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension CGFloat {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension Int {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension CGFloat {
    func minus() -> CGFloat{
        return 0 - self
    }
}

func topViewController() -> UIViewController? {
    var window = UIApplication.shared.delegate?.window ?? UIWindow()
    if window?.windowLevel != UIWindow.Level.normal {
        let windows = UIApplication.shared.windows
        for tmpWin in windows {
            if tmpWin.windowLevel == UIWindow.Level.normal {
                window = tmpWin
                break
            }
        }
    }
    var rootVC = window?.rootViewController
    var activityVC: UIViewController?
    while true {
        if let navController = rootVC as? UINavigationController {
            activityVC = navController.visibleViewController
        } else if let tabController = rootVC as? UITabBarController {
            activityVC = tabController.selectedViewController
        } else if let presentedVC = rootVC?.presentedViewController {
            activityVC = presentedVC
        } else {
            break
        }
        
        rootVC = activityVC
    }
    return activityVC
}

//图片压缩
extension Data {
    static func compressQuality(image: UIImage, maxLength: Int) -> Data? {
        var compression: CGFloat = 0.7
        var data = image.jpegData(compressionQuality: compression)
        if let imageData = data, imageData.count < maxLength {
            return data
        }
        var max: CGFloat = 1.0
        var min: CGFloat = 0.0
        for _ in 0..<5 {
            compression = (max + min) / 2
            if let imageData = image.jpegData(compressionQuality: compression) {
                if imageData.count < Int(Double(maxLength) * 0.8) {
                    min = compression
                } else if imageData.count > maxLength {
                    max = compression
                } else {
                    break
                }
                data = imageData
            }
        }
        return data
    }
}
