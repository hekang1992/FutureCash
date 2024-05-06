//
//  FCPhotoView.swift
//  FutureCash
//
//  Created by apple on 2024/5/6.
//

import UIKit

class FCPhotoView: UIView {

    lazy var iconImageView1: UIImageView = {
        let iconImageView1 = UIImageView()
        iconImageView1.contentMode = .scaleAspectFill
        iconImageView1.clipsToBounds = true
        iconImageView1.image = UIImage(named: "bg1")
        iconImageView1.isUserInteractionEnabled = true
        return iconImageView1
    }()
    
    lazy var iconImageView2: UIImageView = {
        let iconImageView2 = UIImageView()
        iconImageView2.image = UIImage(named: "facebgi")
        iconImageView2.isUserInteractionEnabled = true
        return iconImageView2
    }()
    
    lazy var titleLable: FFShadowLabel = {
        let titleLable = FFShadowLabel(strockColor: UIColor.init(css: "#4B520E"))
        titleLable.font = UIFont(name: Fredoka_Medium, size: 16.px())
        titleLable.textAlignment = .center
        titleLable.numberOfLines = 0
        titleLable.text = "Please ensure that the uploaded ID card type matches the selected ID card!"
        let radians = CGFloat(tan(-2.0 * Double.pi / 180))
        titleLable.transform = CGAffineTransform(rotationAngle: radians)
        return titleLable
    }()
    
    lazy var iconImageView3: UIImageView = {//证件照片
        let iconImageView3 = UIImageView()
        return iconImageView3
    }()
    
    lazy var iconImageView4: UIImageView = {
        let iconImageView4 = UIImageView()
        iconImageView4.image = UIImage(named: "Slicephpo")
        return iconImageView4
    }()
    
    lazy var iconImageView5: UIImageView = {
        let iconImageView5 = UIImageView()
        iconImageView5.image = UIImage(named: "Slicedemo")
        return iconImageView5
    }()
    
    lazy var descLable: UILabel = {
        let descLable = UILabel.createLabel(font: UIFont(name: Fredoka_Medium, size: 16.px())!, textColor: UIColor.init(css: "#7EC101"), textAlignment: .center)
        descLable.text = "Ensure a clear and legible ID card photo with no missing parts."
        descLable.numberOfLines = 0
        return descLable
    }()
    
    lazy var albumBtn: UIButton = {
        let albumBtn = UIButton(type: .custom)
        albumBtn.setImage(UIImage(named: "lbumicon"), for: .normal)
        return albumBtn
    }()
    
    lazy var cameraBtn: UIButton = {
        let cameraBtn = UIButton(type: .custom)
        cameraBtn.setImage(UIImage(named: "cameraicon"), for: .normal)
        return cameraBtn
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.isHidden = true
        nextBtn.setImage(UIImage(named: "nexticon"), for: .normal)
        return nextBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView1)
        iconImageView1.addSubview(iconImageView2)
        iconImageView2.addSubview(titleLable)
        iconImageView2.addSubview(iconImageView3)
        iconImageView2.addSubview(iconImageView4)
        iconImageView2.addSubview(iconImageView5)
        iconImageView2.addSubview(descLable)
        iconImageView1.addSubview(nextBtn)
        iconImageView1.addSubview(albumBtn)
        iconImageView1.addSubview(cameraBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FCPhotoView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView1.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        if let vc = self.viewController  {
            let height = UIViewController.getTopBarHeights(for: vc)
            iconImageView2.snp.makeConstraints { make in
                make.centerX.equalTo(iconImageView1)
                make.size.equalTo(CGSizeMake(375.px(), 599.px()))
                make.top.equalTo(height.totalHeight)
            }
        }
        titleLable.snp.makeConstraints { make in
            make.left.equalTo(self).offset(32.5.px())
            make.top.equalTo(iconImageView2).offset(85.px())
            make.right.equalTo(self).offset(-50.px())
        }
        iconImageView3.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView2)
            make.size.equalTo(CGSizeMake(244.px(), 145.px()))
            make.top.equalTo(titleLable.snp.bottom).offset(48.5.px())
        }
        iconImageView4.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView2)
            make.size.equalTo(CGSizeMake(269.px(), 170.px()))
            make.top.equalTo(titleLable.snp.bottom).offset(35.5.px())
        }
        iconImageView5.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView2)
            make.size.equalTo(CGSizeMake(254.px(), 65.px()))
            make.top.equalTo(iconImageView4.snp.bottom).offset(31.px())
        }
        descLable.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView2)
            make.top.equalTo(iconImageView5.snp.bottom).offset(19.px())
            make.left.equalTo(iconImageView2).offset(50.px())
        }
        albumBtn.snp.makeConstraints { make in
            make.left.equalTo(iconImageView1).offset(10.px())
            make.size.equalTo(CGSizeMake(183.px(), 85.px()))
            make.top.equalTo(descLable.snp.bottom).offset(79.5.px())
        }
        cameraBtn.snp.makeConstraints { make in
            make.right.equalTo(iconImageView1).offset(-10.px())
            make.size.equalTo(CGSizeMake(183.px(), 85.px()))
            make.top.equalTo(descLable.snp.bottom).offset(79.5.px())
        }
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView1)
            make.size.equalTo(CGSizeMake(183.px(), 85.px()))
            make.top.equalTo(descLable.snp.bottom).offset(79.5.px())
        }
    }
    
}
