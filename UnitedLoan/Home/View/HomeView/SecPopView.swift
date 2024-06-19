//
//  SecPopView.swift
//  UnitedLoan
//
//  Created by apple on 2024/6/19.
//

import UIKit

class SecPopView: UIView {
    
    var block: (() -> Void)?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .randomColor()
        return scrollView
    }()

    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "home_bg_sec")
        return iconImageView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "nexticon"), for: .normal)
        btn.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: UIColor.init(css: "#943800"), textAlignment: .center)
        nameLabel.text = "Regulatfory Partners"
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        addSubview(btn)
        iconImageView.addSubview(scrollView)
        iconImageView.addSubview(nameLabel)
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(141.px())
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(12.px())
            make.size.equalTo(CGSize(width: 351, height: 518))
        }
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconImageView.snp.bottom).offset(8.px())
            make.size.equalTo(CGSize(width: 178.px(), height: 86.px()))
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30.px())
            make.left.equalToSuperview()
            make.height.equalTo(22.px())
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(15.px())
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(44.px())
            make.bottom.equalToSuperview().offset(-20.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SecPopView {
    
    @objc func nextClick() {
        self.block?()
    }
    
}

