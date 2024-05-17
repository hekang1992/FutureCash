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
    
    lazy var label1: FFShadowLabel = {
        let label1 = FFShadowLabel()
        label1.font = UIFont(name: Fredoka_Bold, size: 16.px())
        label1.textAlignment = .center
        label1.text = "Phone Number"
        return label1
    }()
    
    lazy var label2: UILabel = {
        let label2 = UILabel.createLabel(font: UIFont(name: Fredoka_Medium, size: 15.px())!, textColor: UIColor.init(css: "#384067"), textAlignment: .center)
        label2.text = "+63 9277792991"
        return label2
    }()
    
    lazy var label3: FFShadowLabel = {
        let label3 = FFShadowLabel()
        label3.font = UIFont(name: Fredoka_Bold, size: 16.px())
        label3.textAlignment = .center
        label3.text = "Email"
        return label3
    }()
    
    lazy var label4: UILabel = {
        let label4 = UILabel.createLabel(font: UIFont(name: Fredoka_Medium, size: 15.px())!, textColor: UIColor.init(css: "#384067"), textAlignment: .center)
        label4.text = "official@unitedsrj.com"
        return label4
    }()
    
    lazy var label5: FFShadowLabel = {
        let label5 = FFShadowLabel()
        label5.font = UIFont(name: Fredoka_Bold, size: 16.px())
        label5.textAlignment = .center
        label5.text = "Whats App"
        return label5
    }()
    
    lazy var label6: UILabel = {
        let label6 = UILabel.createLabel(font: UIFont(name: Fredoka_Medium, size: 15.px())!, textColor: UIColor.init(css: "#384067"), textAlignment: .center)
        label6.text = "+63 9277792991"
        return label6
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
        bgIcon2.addSubview(label1)
        bgIcon2.addSubview(label2)
        scrollView.addSubview(bgIcon3)
        bgIcon3.addSubview(label3)
        bgIcon3.addSubview(label4)
        scrollView.addSubview(bgIcon4)
        bgIcon4.addSubview(label5)
        bgIcon4.addSubview(label6)
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
        label1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12.px())
            make.left.equalToSuperview()
            make.height.equalTo(19.5.px())
        }
        label2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label1.snp.bottom).offset(7.px())
            make.left.equalToSuperview()
            make.height.equalTo(19.5.px())
        }
        bgIcon3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon2.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(74.px())
        }
        label3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12.px())
            make.left.equalToSuperview()
            make.height.equalTo(19.5.px())
        }
        label4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label3.snp.bottom).offset(7.px())
            make.left.equalToSuperview()
            make.height.equalTo(19.5.px())
        }
        bgIcon4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgIcon3.snp.bottom).offset(20.px())
            make.left.equalToSuperview().offset(15.px())
            make.height.equalTo(74.px())
        }
        label5.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12.px())
            make.left.equalToSuperview()
            make.height.equalTo(19.5.px())
        }
        label6.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label5.snp.bottom).offset(7.px())
            make.left.equalToSuperview()
            make.height.equalTo(19.5.px())
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
