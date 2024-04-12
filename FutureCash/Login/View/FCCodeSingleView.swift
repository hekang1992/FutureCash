//
//  FCCodeSingleView.swift
//  FutureCash
//
//  Created by apple on 2024/4/12.
//

import Foundation
import UIKit

class FCCodeSingleView: UIView{
    
    lazy var label: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: UIColor.init(css: "#B74C1B"), textAlignment: .center)
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.isUserInteractionEnabled = true
        iconImageView.image = UIImage(named: "codep")
        return iconImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        iconImageView.addSubview(label)
        iconImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        label.snp.makeConstraints { make in
            make.edges.equalTo(iconImageView)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}

public class MHVerifyCodeView: UIStackView, UITextFieldDelegate {
    
    var verifyCodes: [FCCodeSingleView]!
    
    /**验证码数量*/
    public var verifyCount: Int? {
        didSet{
            for _ in Range(0...(verifyCount ?? 4) - 1) {
                let singleView = FCCodeSingleView(frame: CGRect(x: 0, y: 0, width: 39.px(), height: 39.px()))
                verifyCodes.append(singleView)
                self.addArrangedSubview(singleView)
            }
        }
    }
    
    /**验证码输入完成后的回调闭包，返回参数为验证码*/
    var completeHandler: ((_ verifyCode: String) -> Void)!
    
    //隐藏的输入框
    lazy var hideTextField: UITextField = {
        let textfield = UITextField()
        self.addSubview(textfield)
        textfield.keyboardType = .numberPad
        textfield.delegate = self
        return textfield
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.distribution = .fillEqually
        verifyCodes = []
        verifyCount = 4
    }
    
    /**
     - parameter complete: 验证完成回调闭包，返回参数为验证码
     */
    public convenience init(complete: @escaping (_ verifyCode: String) -> Void) {
        self.init()
        setCompleteHandler(complete: complete)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**设置验证码输入完成后的回调闭包*/
    public func setCompleteHandler(complete: @escaping (_ verifyCode: String) -> Void) {
        self.completeHandler = complete
    }
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        guard textField.text!.count <= (verifyCount ?? 4) else {
            textField.text = String(textField.text!.prefix(4))
            return
        }
        
        var index = 0
        for char in textField.text! {
            verifyCodes[index].label.text = String(char)
            index += 1
        }
        guard index < (verifyCount ?? 4) else {
            self.endEditing(true)
            if let complete = self.completeHandler {
                complete(textField.text!)
            }
            return
        }
        for i in Range(index...(verifyCount ?? 4) - 1) {
            verifyCodes[i].label.text = ""
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideTextField.becomeFirstResponder()
    }
    
}
