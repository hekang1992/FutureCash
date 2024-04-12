//
//  LoginView.swift
//  FutureCash
//
//  Created by apple on 2024/3/26.
//

import UIKit
import UIColor_Hex

typealias LoginCanBlock = () -> Void
class LoginView: UIView {
    
    var block1: LoginCanBlock?
    var block2: LoginCanBlock?
    var block3: LoginCanBlock?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(css: "#2F0C00").withAlphaComponent(0.4)
        return bgView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "loginbg")
        return bgImageView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "quxiao"), for: .normal)
        btn.addTarget(self, action: #selector(canClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn1: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "button"), for: .normal)
        btn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var bgImageView1: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "phonenum")
        return bgImageView
    }()
    
    lazy var bgImageView2: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "phiamge")
        return bgImageView
    }()
    
    lazy var bgImageView3: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "phone")
        return bgImageView
    }()
    
    lazy var phoneTed: UITextField = {
        let phoneTed = UITextField()
        phoneTed.tintColor = UIColor.init(css: "#B74C1B")
        phoneTed.textColor = UIColor.init(css: "#B74C1B");
        phoneTed.font = UIFont(name: Fredoka_Bold, size: 18.px())
        let attrString = NSMutableAttributedString(string: "Enter Phone Number", attributes: [
            .foregroundColor: UIColor.init(css: "#FECD66") as Any,
            .font: UIFont(name: Fredoka_Bold, size: 16.px())!
        ])
        phoneTed.attributedPlaceholder = attrString
        phoneTed.keyboardType = .numberPad
        return phoneTed
    }()
    
    lazy var codeLable: UILabel = {
        let codeLable = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 16.px())!, textColor: UIColor.init(css: "#B74C1B"), textAlignment: .left)
        codeLable.text = "Verification Code"
        return codeLable
    }()
    
    lazy var codeView: MHVerifyCodeView = {
        let codeView = MHVerifyCodeView.init { verifyCode in
            print("verifyCode>>>>>>>\(verifyCode)")
        }
        codeView.verifyCount = 6
        codeView.spacing = 4.px()
        return codeView
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "fasong"), for: .normal)
        btn.addTarget(self, action: #selector(sendClick), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(bgImageView)
        bgImageView.addSubview(btn)
        bgImageView.addSubview(btn1)
        bgImageView.addSubview(bgImageView3)
        bgImageView.addSubview(bgImageView1)
        bgImageView.addSubview(bgImageView2)
        bgImageView3.addSubview(phoneTed)
        bgImageView.addSubview(codeLable)
        bgImageView.addSubview(codeView)
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        bgImageView.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.bottom.equalTo(bgView).offset(-150.px())
            make.size.equalTo(CGSizeMake(338.px(), 389.px()))
        }
        btn.snp.makeConstraints { make in
            make.top.equalTo(bgImageView.snp.top).offset(6.px())
            make.right.equalTo(bgImageView.snp.right).offset(-11.px())
            make.size.equalTo(CGSizeMake(33.px(), 35.px()))
        }
        btn1.snp.makeConstraints { make in
            make.centerX.equalTo(bgImageView)
            make.bottom.equalTo(bgImageView)
            make.size.equalTo(CGSizeMake(134.px(), 61.px()))
        }
        bgImageView3.snp.makeConstraints { make in
            make.top.equalTo(bgImageView).offset(111.px())
            make.left.equalTo(bgImageView).offset(33.px())
            make.size.equalTo(CGSizeMake(244.px(), 54.px()))
        }
        bgImageView1.snp.makeConstraints { make in
            make.size.equalTo(CGSizeMake(129.px(), 23.px()))
            make.top.equalTo(bgImageView3.snp.top).offset(-13.px())
            make.left.equalTo(bgImageView3.snp.left).offset(-12.px())
        }
        bgImageView2.snp.makeConstraints { make in
            make.size.equalTo(CGSizeMake(75.px(), 23.px()))
            make.top.equalTo(bgImageView3.snp.top).offset(-13.px())
            make.left.equalTo(bgImageView1.snp.right).offset(12.px())
        }
        phoneTed.snp.makeConstraints { make in
            make.left.equalTo(bgImageView3).offset(15.px())
            make.top.equalTo(bgImageView1.snp.bottom).offset(-4.px())
            make.bottom.equalTo(bgImageView3)
            make.right.equalTo(bgImageView3).offset(-50.px())
        }
        codeLable.snp.makeConstraints { make in
            make.left.equalTo(bgImageView3.snp.left)
            make.top.equalTo(phoneTed.snp.bottom).offset(25.px())
            make.height.equalTo(20.constraintMultiplierTargetValue)
        }
        codeView.snp.makeConstraints { make in
            make.left.equalTo(bgImageView3.snp.left)
            make.top.equalTo(codeLable.snp.bottom).offset(10.px())
            make.height.equalTo(39.px())
            make.right.equalTo(bgImageView3.snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    @objc func canClick() {
        self.block1?()
    }
    
    @objc func loginClick() {
        self.block2?()
    }
    
    @objc func sendClick() {
        self.block3?()
    }
    
}
