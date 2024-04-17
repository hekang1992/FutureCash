//
//  RightView.swift
//  FutureCash
//
//  Created by apple on 2024/4/17.
//

import UIKit

class RightView: UIView {
    
    var block1: (() -> Void)?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(css: "#4B2F06").withAlphaComponent(0.6)
        return bgView
    }()

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "homebg")
        return bgImageView
    }()
    
    lazy var bgImageView1: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.alpha = 0
        bgImageView.isUserInteractionEnabled = false
        bgImageView.image = UIImage(named: "yinyingbg")
        return bgImageView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "quxiao"), for: .normal)
        btn.addTarget(self, action: #selector(canClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var bgImageView2: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "bgqw")
        return bgImageView
    }()
    
    lazy var bgImageView3: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "hongqi")
        return bgImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: .white, textAlignment: .center)
        titleLabel.text = "Orders"
        return titleLabel
    }()
    
    lazy var rightTabView: RightTableView = {
        let rightTabView = RightTableView()
        return rightTabView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(bgImageView)
        bgView.addSubview(bgImageView1)
        bgImageView.addSubview(btn)
        bgImageView.addSubview(titleLabel)
        bgImageView.addSubview(bgImageView2)
        bgImageView2.addSubview(bgImageView3)
        bgImageView2.addSubview(rightTabView)
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        bgImageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 45.constraintMultiplierTargetValue, left: SCREEN_WIDTH, bottom: 18.px(), right: 0.px()))
        }
        bgImageView1.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
        btn.snp.makeConstraints { make in
            make.top.equalTo(bgImageView).offset(20.px())
            make.left.equalTo(bgImageView).offset(15.px())
            make.size.equalTo(CGSizeMake(31.px(), 33.px()))
        }
        bgImageView2.snp.makeConstraints { make in
            make.right.equalTo(bgImageView)
            make.bottom.equalTo(bgImageView).offset(-63.px())
            make.left.equalTo(bgImageView).offset(20.px())
            make.top.equalTo(bgImageView).offset(68.px())
        }
        titleLabel.snp.makeConstraints { make in
            make.right.equalTo(bgImageView)
            make.left.equalTo(btn.snp.right)
            make.top.equalTo(bgImageView)
            make.bottom.equalTo(bgImageView2.snp.top)
        }
        bgImageView3.snp.makeConstraints { make in
            make.top.equalTo(bgImageView2)
            make.left.equalTo(bgImageView2).offset(8.5.px())
            make.size.equalTo(CGSizeMake(180.px(), 217.5.px()))
        }
        rightTabView.snp.makeConstraints { make in
            make.left.right.equalTo(bgImageView2)
            make.top.equalTo(bgImageView3.snp.bottom).offset(13.5.px())
            make.bottom.equalTo(bgImageView2).offset(-10.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension RightView {
    
    @objc func canClick() {
        self.block1?()
    }
    
}
