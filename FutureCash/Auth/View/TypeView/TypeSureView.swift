//
//  TypeSureView.swift
//  FutureCash
//
//  Created by apple on 2024/4/29.
//

import UIKit

class TypeSureView: UIView {

    lazy var bgimageView: UIImageView = {
        let bgimageView = UIImageView()
        bgimageView.image = UIImage(named: "Sliceyello")
        return bgimageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgimageView)
        bgimageView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(170.px())
            make.size.equalTo(CGSizeMake(320.px(), 357.px()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
