//
//  RightThreeView.swift
//  FutureCash
//
//  Created by apple on 2024/5/14.
//

import UIKit

class RightThreeView: UIView {

    lazy var hongqi: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "hongqi")
        return bgImageView
    }()
    
    lazy var bgIcon1: UIImageView = {
        let bgIcon1 = UIImageView()
        bgIcon1.backgroundColor = .randomColor()
        return bgIcon1
    }()
    
    lazy var bgIcon2: UIImageView = {
        let bgIcon2 = UIImageView()
        bgIcon2.backgroundColor = .randomColor()
        return bgIcon2
    }()
    
    lazy var bgIcon3: UIImageView = {
        let bgIcon3 = UIImageView()
        bgIcon3.backgroundColor = .randomColor()
        return bgIcon3
    }()
    
    lazy var bgIcon4: UIImageView = {
        let bgIcon4 = UIImageView()
        bgIcon4.backgroundColor = .randomColor()
        return bgIcon4
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hongqi)
        addSubview(bgIcon1)
        addSubview(bgIcon2)
        addSubview(bgIcon3)
        addSubview(bgIcon4)
        hongqi.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(8.5.px())
            make.size.equalTo(CGSizeMake(180.px(), 217.5.px()))
        }
        bgIcon1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hongqi.snp.bottom).offset(25.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(70.px())
        }
        bgIcon2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon1.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(70.px())
        }
        bgIcon3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon2.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(70.px())
        }
        bgIcon4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon3.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(70.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RightThreeView {
    
}
