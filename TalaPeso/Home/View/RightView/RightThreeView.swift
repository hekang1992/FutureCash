//
//  RightThreeView.swift
//  FutureCash
//
//  Created by apple on 2024/5/14.
//

import UIKit

class RightThreeView: UIView {

    lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    lazy var hongqi: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "hongqi")
        return bgImageView
    }()
    
    lazy var bgIcon1: UIImageView = {
        let bgIcon1 = UIImageView()
        bgIcon1.image = UIImage(named: "f4trvfda")
        return bgIcon1
    }()
    
    lazy var bgIcon2: UIImageView = {
        let bgIcon2 = UIImageView()
        bgIcon2.image = UIImage(named: "f4trvfda")
        return bgIcon2
    }()
    
    lazy var bgIcon3: UIImageView = {
        let bgIcon3 = UIImageView()
        bgIcon3.image = UIImage(named: "f4trvfda")
        return bgIcon3
    }()
    
    lazy var bgIcon4: UIImageView = {
        let bgIcon4 = UIImageView()
        bgIcon4.image = UIImage(named: "f4trvfda")
        return bgIcon4
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(scrollView)
        scrollView.addSubview(hongqi)
        scrollView.addSubview(bgIcon1)
        scrollView.addSubview(bgIcon2)
        scrollView.addSubview(bgIcon3)
        scrollView.addSubview(bgIcon4)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hongqi.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.size.equalTo(CGSizeMake(140.px(), 226.px()))
        }
        bgIcon1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hongqi.snp.bottom).offset(25.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(74.px())
        }
        bgIcon2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon1.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(74.px())
        }
        bgIcon3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon2.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(74.px())
        }
        bgIcon4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon3.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(74.px())
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgIcon4.setNeedsLayout()
        self.layoutIfNeeded()
        let maxY = CGRectGetMaxY(bgIcon4.frame)
        scrollView.contentSize = CGSizeMake(0, maxY + 20.px())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RightThreeView {
    
}
