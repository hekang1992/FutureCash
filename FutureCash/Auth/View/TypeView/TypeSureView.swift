//
//  TypeSureView.swift
//  FutureCash
//
//  Created by apple on 2024/4/29.
//

import UIKit

class TypeSureView: UIView {
    
    var block: (() -> Void)?

    lazy var bgimageView: UIImageView = {
        let bgimageView = UIImageView()
        bgimageView.image = UIImage(named: "Sliceyello")
        return bgimageView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "quxiao"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(btn)
        addSubview(bgimageView)
        btn.snp.makeConstraints { make in
            make.left.equalTo(self).offset(27.5.px())
            make.size.equalTo(CGSizeMake(31.px(), 33.px()))
            make.top.equalTo(self).offset(145.px())
        }
        bgimageView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(btn.snp.bottom).offset(6.px())
            make.size.equalTo(CGSizeMake(320.px(), 357.px()))
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TypeSureView {
    
    @objc func btnClick() {
        self.block?()
    }
    
}
