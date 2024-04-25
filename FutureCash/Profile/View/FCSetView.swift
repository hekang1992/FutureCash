//
//  FCSetView.swift
//  FutureCash
//
//  Created by apple on 2024/4/24.
//

import UIKit
import MBProgressHUD

class FCSetView: UIView {

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "BGvc")
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "ccc11")
        iconImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        iconImageView.addGestureRecognizer(tapGesture)
        return iconImageView
    }()
    
    lazy var titleLable: FFShadowLabel = {
        let titleLable = FFShadowLabel(strockColor: UIColor.init(css: "#384067"))
        titleLable.font = UIFont(name: Fredoka_Bold, size: 16.px())
        titleLable.textAlignment = .center
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let cacheSize = calculateCacheSize(forDirectory: cacheURL)
        titleLable.text = "Clear Cache     \(cacheSize)"
        return titleLable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        bgImageView.addSubview(iconImageView)
        iconImageView.addSubview(titleLable)
        bgImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(110.px())
            make.centerX.equalTo(self)
            make.size.equalTo(CGSizeMake(315.px(), 56.px()))
        }
        titleLable.snp.makeConstraints { make in
            make.center.equalTo(iconImageView)
            make.width.equalTo(200.px())
            make.height.equalTo(22.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FCSetView {
    
    func calculateCacheSize(forDirectory directory: URL) -> String {
        let fileManager = FileManager.default
        var totalSize: Int64 = 0
        guard let enumerator = fileManager.enumerator(at: directory, includingPropertiesForKeys: nil) else {
            return "0 MB"
        }
        for case let fileURL as URL in enumerator {
            do {
                let attributes = try fileManager.attributesOfItem(atPath: fileURL.path)
                if let fileSize = attributes[.size] as? Int64 {
                    totalSize += fileSize
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        let totalSizeInMB = Double(totalSize) / (1024 * 1024)
        let formattedSize = String(format: "%.2f MB", totalSizeInMB)
        return formattedSize
    }
    
    func deleteCache(forDirectory directory: URL) {
        let fileManager = FileManager.default
        guard let enumerator = fileManager.enumerator(at: directory, includingPropertiesForKeys: nil) else {
            return
        }
        for case let fileURL as URL in enumerator {
            do {
                try fileManager.removeItem(at: fileURL)
                print("Deleted file: \(fileURL.lastPathComponent)")
            } catch {
                print("Error deleting file: \(error.localizedDescription)")
            }
        }
        print("Cache cleared.")
    }
    
    @objc func imageTapped() {
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        deleteCache(forDirectory: cacheURL)
        let loadView = ViewHud.createLoadView()
        if let keyWindow = UIApplication.shared.windows.first {
            keyWindow.addSubview(loadView)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.titleLable.text = "Clear Cache     0.00MB"
            loadView.removeFromSuperview()
        }
    }
    
}
