//
//  CardTypeView.swift
//  FutureCash
//
//  Created by apple on 2024/4/26.
//

import UIKit

class CardTypeView: UIView {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .clear
        return bgView
    }()
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView1 = UIImageView()
        iconImageView1.contentMode = .scaleAspectFill
        iconImageView1.clipsToBounds = true
        iconImageView1.image = UIImage(named: "bg1")
        return iconImageView1
    }()
    
    lazy var iconImageView2: UIImageView = {
        let iconImageView2 = UIImageView()
        iconImageView2.image = UIImage(named: "bg3")
        return iconImageView2
    }()
    
    lazy var iconImageView3: UIImageView = {
        let iconImageView3 = UIImageView()
        iconImageView3.image = UIImage(named: "bg2")
        return iconImageView3
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(iconImageView1)
        bgView.addSubview(iconImageView2)
        bgView.addSubview(iconImageView3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        iconImageView1.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
        if let vc = self.viewController  {
            let height = UIViewController.getTopBarHeights(for: vc)
            iconImageView2.snp.makeConstraints { make in
                make.centerX.equalTo(bgView)
                make.size.equalTo(CGSizeMake(375.px(), 159.px()))
                make.top.equalTo(height.totalHeight)
            }
        }
        iconImageView3.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(iconImageView2.snp.bottom).offset(13.px())
            make.size.equalTo(CGSizeMake(375.px(), 465.px()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
