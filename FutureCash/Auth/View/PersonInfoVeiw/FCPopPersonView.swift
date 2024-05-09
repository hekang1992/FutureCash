//
//  FCPopPersonView.swift
//  FutureCash
//
//  Created by apple on 2024/5/9.
//

import UIKit

class FCPopPersonView: UIView {
    
    var modelArray: [PModel]?
    
    var block: (() -> Void)?

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "bgikuu")
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    lazy var canBtn: UIButton = {
        let canBtn = UIButton(type: .custom)
        canBtn.setImage(UIImage(named: "quxiao"), for: .normal)
        canBtn.addTarget(self, action: #selector(canClick), for: .touchUpInside)
        return canBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        bgImageView.addSubview(canBtn)
        bgImageView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(550.px())
        }
        canBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSizeMake(31.px(), 33.px()))
            make.top.equalTo(bgImageView).offset(20.px())
            make.left.equalTo(bgImageView).offset(20.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FCPopPersonView {
    
    @objc func canClick() {
        self.block?()
    }
}
