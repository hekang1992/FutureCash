//
//  BaseHeadFile.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import Foundation

// DEFINE
// 宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
// 高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
// 状态栏高度
let STATUSBAR_HIGH = IS_iPhoneXSeries() ? 44 : 20
// 导航栏高度
let NAV_HIGH = 44 + STATUSBAR_HIGH;

let Key_Service = "Key_Service"

let Key_Account = "Key_Account"

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

extension String {
    func convertBase64(_ dict: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            let base64EncodedString = jsonData.base64EncodedString()
            return base64EncodedString
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}

func getCurrentUIVC() -> UIViewController? {
    guard let superVC = getCurrentVC() else {
        return nil
    }
    if let tabBarController = superVC as? UITabBarController {
        if let tabSelectVC = tabBarController.selectedViewController as? UINavigationController {
            return tabSelectVC.viewControllers.last
        } else {
            return tabBarController.selectedViewController
        }
    } else if let navigationController = superVC as? UINavigationController {
        return navigationController.viewControllers.last
    }
    return superVC
}

func getCurrentVC() -> UIViewController? {
    var result: UIViewController?
    var window = UIApplication.shared.keyWindow
    if window?.windowLevel != UIWindow.Level.normal {
        let windows = UIApplication.shared.windows
        for tmpWin in windows {
            if tmpWin.windowLevel == UIWindow.Level.normal {
                window = tmpWin
                break
            }
        }
    }
    if let frontView = window?.subviews.first {
        if let nextResponder = frontView.next {
            if let viewController = nextResponder as? UIViewController {
                result = viewController
            } else {
                result = window?.rootViewController
            }
        }
    }
    return result
}
