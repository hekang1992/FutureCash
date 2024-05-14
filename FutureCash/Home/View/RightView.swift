//
//  RightView.swift
//  FutureCash
//
//  Created by apple on 2024/4/17.
//

import UIKit
import SnapKit

class RightView: UIView {
    
    var block1: (() -> Void)?
    
    var block2: (() -> Void)?
    
    var buttonHeightConstraints: [Constraint] = []
    
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
    
    lazy var btn1: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "seticon"), for: .normal)
        btn.addTarget(self, action: #selector(setClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var bgImageView2: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "whiteBG")
        return bgImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: .white, textAlignment: .center)
        titleLabel.text = "Orders"
        return titleLabel
    }()
    
    lazy var buttons: [UIButton] = {
        let titles = ["Orders", "About", "Connect"]
        let images = ["iconqw", "iconqw", "iconqw"]
        let buttons = titles.enumerated().map { (index, title) in
            return createButton(title: title, image: images[index])
        }
        return buttons
    }()
    
    lazy var oneView: RightOneView = {
        let oneView = RightOneView()
        return oneView
    }()
    
    lazy var twoView: RightTwoView = {
        let twoView = RightTwoView()
        return twoView
    }()
    
    lazy var threeView: RightThreeView = {
        let threeView = RightThreeView()
        return threeView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(bgImageView)
        addSubview(bgImageView1)
        bgImageView.addSubview(btn)
        bgImageView.addSubview(btn1)
        bgImageView.addSubview(titleLabel)
        bgImageView.addSubview(bgImageView2)
        bgImageView2.addSubview(oneView)
        bgImageView2.addSubview(twoView)
        bgImageView2.addSubview(threeView)
        buttons.forEach { bgImageView.addSubview($0) }
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        bgImageView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(45.px())
            make.left.equalTo(self).offset(SCREEN_WIDTH)
            make.bottom.equalTo(self).offset(-18.px())
            make.width.equalTo(SCREEN_WIDTH - 70.px())
        }
        bgImageView1.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
        btn.snp.makeConstraints { make in
            make.top.equalTo(bgImageView).offset(20.px())
            make.left.equalTo(bgImageView).offset(15.px())
            make.size.equalTo(CGSizeMake(31.px(), 33.px()))
        }
        btn1.snp.makeConstraints { make in
            make.top.equalTo(bgImageView).offset(20.px())
            make.right.equalTo(bgImageView).offset(-9.px())
            make.size.equalTo(CGSizeMake(32.px(), 32.px()))
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
        oneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        twoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        threeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        buttons[0].snp.makeConstraints { make in
            make.top.equalTo(bgImageView2.snp.bottom)
            make.left.equalTo(bgImageView).offset(27.px())
            make.width.equalTo(88.px())
            buttonHeightConstraints.append(make.height.equalTo(33.px()).constraint)
        }
        buttons[1].snp.makeConstraints { make in
            make.top.equalTo(bgImageView2.snp.bottom)
            make.left.equalTo(buttons[0].snp.right).offset(3.5.px())
            make.width.equalTo(88.px())
            buttonHeightConstraints.append(make.height.equalTo(33.px()).constraint)
        }
        buttons[2].snp.makeConstraints { make in
            make.top.equalTo(bgImageView2.snp.bottom)
            make.left.equalTo(buttons[1].snp.right).offset(3.5.px())
            make.width.equalTo(88.px())
            buttonHeightConstraints.append(make.height.equalTo(33.px()).constraint)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.buttonClicked(self.buttons[0])
    }
    
}

extension RightView {
    
    private func createButton(title: String, image: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
        button.setBackgroundImage(UIImage(named: image), for: .normal)
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc private func canClick() {
        self.block1?()
    }
    
    @objc private func setClick() {
        self.block2?()
    }
    
    @objc private func buttonClicked(_ sender: UIButton) {
        buttons.forEach {
            $0.setBackgroundImage(UIImage(named: "iconqw"), for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
        }
        sender.setBackgroundImage(UIImage(named: "selecrtre"), for: .normal)
        sender.setTitleColor(UIColor.init(css: "#943800"), for: .normal)
        sender.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 18.px())
        let index = buttons.firstIndex(of: sender) ?? 0
        updateButtonHeightConstraints(selectedIndex: index)
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
    
    private func updateButtonHeightConstraints(selectedIndex: Int) {
        buttons.enumerated().forEach { index, button in
            let heightConstraint = index == selectedIndex ? 42.px() : 33.px()
            buttonHeightConstraints[index].update(offset: heightConstraint)
            if selectedIndex == 0 {
                oneView.isHidden = false
                twoView.isHidden = true
                threeView.isHidden = true
                
            }else if selectedIndex == 1 {
                oneView.isHidden = true
                twoView.isHidden = false
                threeView.isHidden = true
            }else {
                oneView.isHidden = true
                twoView.isHidden = true
                threeView.isHidden = false
            }
        }
    }
    
}
