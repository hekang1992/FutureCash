//
//  RightView.swift
//  FutureCash
//
//  Created by apple on 2024/4/17.
//

import UIKit
import SnapKit

//class RightView: UIView {
//
//    var button1HeightConstraint: Constraint?
//    var button2HeightConstraint: Constraint?
//    var button3HeightConstraint: Constraint?
//
//    var block1: (() -> Void)?
//
//    lazy var bgView: UIView = {
//        let bgView = UIView()
//        bgView.backgroundColor = UIColor.init(css: "#4B2F06").withAlphaComponent(0.6)
//        return bgView
//    }()
//
//    lazy var bgImageView: UIImageView = {
//        let bgImageView = UIImageView()
//        bgImageView.isUserInteractionEnabled = true
//        bgImageView.image = UIImage(named: "homebg")
//        return bgImageView
//    }()
//
//    lazy var bgImageView1: UIImageView = {
//        let bgImageView = UIImageView()
//        bgImageView.alpha = 0
//        bgImageView.isUserInteractionEnabled = false
//        bgImageView.image = UIImage(named: "yinyingbg")
//        return bgImageView
//    }()
//
//    lazy var btn: UIButton = {
//        let btn = UIButton(type: .custom)
//        btn.setImage(UIImage(named: "quxiao"), for: .normal)
//        btn.addTarget(self, action: #selector(canClick), for: .touchUpInside)
//        return btn
//    }()
//
//    lazy var bgImageView2: UIImageView = {
//        let bgImageView = UIImageView()
//        bgImageView.isUserInteractionEnabled = true
//        bgImageView.image = UIImage(named: "bgqw")
//        return bgImageView
//    }()
//
//    lazy var bgImageView3: UIImageView = {
//        let bgImageView = UIImageView()
//        bgImageView.image = UIImage(named: "hongqi")
//        return bgImageView
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let titleLabel = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: .white, textAlignment: .center)
//        titleLabel.text = "Orders"
//        return titleLabel
//    }()
//
//    lazy var rightTabView: RightTableView = {
//        let rightTabView = RightTableView()
//        return rightTabView
//    }()
//
//    lazy var button1: UIButton = {
//        let button = UIButton()
//        button.setTitle("Orders", for: .normal)
//        button.titleLabel?.textAlignment = .center
//        button.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
//        button.setBackgroundImage(UIImage(named: "iconqw"), for: .normal)
//        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var button2: UIButton = {
//        let button = UIButton()
//        button.titleLabel?.textAlignment = .center
//        button.setTitle("About", for: .normal)
//        button.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
//        button.setBackgroundImage(UIImage(named: "iconqw"), for: .normal)
//        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var button3: UIButton = {
//        let button = UIButton()
//        button.titleLabel?.textAlignment = .center
//        button.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
//        button.setTitle("Connect", for: .normal)
//        button.setBackgroundImage(UIImage(named: "iconqw"), for: .normal)
//        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubview(bgView)
//        addSubview(bgImageView)
//        bgView.addSubview(bgImageView1)
//        bgImageView.addSubview(btn)
//        bgImageView.addSubview(titleLabel)
//        bgImageView.addSubview(bgImageView2)
//        bgImageView2.addSubview(bgImageView3)
//        bgImageView2.addSubview(rightTabView)
//        bgImageView.addSubview(button1)
//        bgImageView.addSubview(button2)
//        bgImageView.addSubview(button3)
//        bgView.snp.makeConstraints { make in
//            make.edges.equalTo(self)
//        }
//        bgImageView.snp.makeConstraints { make in
//            make.edges.equalTo(self).inset(UIEdgeInsets(top: 45.constraintMultiplierTargetValue, left: SCREEN_WIDTH, bottom: 18.px(), right: 0.px()))
//        }
//        bgImageView1.snp.makeConstraints { make in
//            make.edges.equalTo(bgView)
//        }
//        btn.snp.makeConstraints { make in
//            make.top.equalTo(bgImageView).offset(20.px())
//            make.left.equalTo(bgImageView).offset(15.px())
//            make.size.equalTo(CGSizeMake(31.px(), 33.px()))
//        }
//        bgImageView2.snp.makeConstraints { make in
//            make.right.equalTo(bgImageView)
//            make.bottom.equalTo(bgImageView).offset(-63.px())
//            make.left.equalTo(bgImageView).offset(20.px())
//            make.top.equalTo(bgImageView).offset(68.px())
//        }
//        titleLabel.snp.makeConstraints { make in
//            make.right.equalTo(bgImageView)
//            make.left.equalTo(btn.snp.right)
//            make.top.equalTo(bgImageView)
//            make.bottom.equalTo(bgImageView2.snp.top)
//        }
//        bgImageView3.snp.makeConstraints { make in
//            make.top.equalTo(bgImageView2)
//            make.left.equalTo(bgImageView2).offset(8.5.px())
//            make.size.equalTo(CGSizeMake(180.px(), 217.5.px()))
//        }
//        rightTabView.snp.makeConstraints { make in
//            make.left.right.equalTo(bgImageView2)
//            make.top.equalTo(bgImageView3.snp.bottom).offset(13.5.px())
//            make.bottom.equalTo(bgImageView2).offset(-10.px())
//        }
//        button1.snp.makeConstraints { make in
//            make.top.equalTo(bgImageView2.snp.bottom)
//            make.left.equalTo(bgImageView).offset(27.px())
//            make.width.equalTo(88.px())
//            self.button1HeightConstraint = make.height.equalTo(33.px()).constraint
//
//        }
//        button2.snp.makeConstraints { make in
//            make.top.equalTo(bgImageView2.snp.bottom)
//            make.left.equalTo(button1.snp.right).offset(3.5.px())
//            make.width.equalTo(88.px())
//            self.button2HeightConstraint = make.height.equalTo(33.px()).constraint
//        }
//        button3.snp.makeConstraints { make in
//            make.top.equalTo(bgImageView2.snp.bottom)
//            make.left.equalTo(button2.snp.right).offset(3.5.px())
//            make.width.equalTo(88.px())
//            self.button3HeightConstraint = make.height.equalTo(33.px()).constraint
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//            self.buttonClicked(self.button1)
//        }
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//
//extension RightView {
//
//    @objc func canClick() {
//        self.block1?()
//    }
//
//    @objc func buttonClicked(_ sender: UIButton) {
//        button1HeightConstraint?.update(offset: 33.px())
//        button2HeightConstraint?.update(offset: 33.px())
//        button3HeightConstraint?.update(offset: 33.px())
//        button1.setBackgroundImage(UIImage(named: "iconqw"), for: .normal)
//        button2.setBackgroundImage(UIImage(named: "iconqw"), for: .normal)
//        button3.setBackgroundImage(UIImage(named: "iconqw"), for: .normal)
//        button1.setTitleColor(.white, for: .normal)
//        button2.setTitleColor(.white, for: .normal)
//        button3.setTitleColor(.white, for: .normal)
//        button1.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
//        button2.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
//        button3.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 12.px())
//        switch sender {
//        case button1:
//            button1HeightConstraint?.update(offset: 42.px())
//            button1.setTitleColor(UIColor.init(css: "#943800"), for: .normal)
//            button1.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 18.px())
//            button1.setBackgroundImage(UIImage(named: "selecrtre"), for: .normal)
//        case button2:
//            button2HeightConstraint?.update(offset: 42.px())
//            button2.setTitleColor(UIColor.init(css: "#943800"), for: .normal)
//            button2.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 18.px())
//            button2.setBackgroundImage(UIImage(named: "selecrtre"), for: .normal)
//        case button3:
//            button3HeightConstraint?.update(offset: 42.px())
//            button3.setTitleColor(UIColor.init(css: "#943800"), for: .normal)
//            button3.titleLabel?.font = UIFont(name: Fredoka_Bold, size: 18.px())
//            button3.setBackgroundImage(UIImage(named: "selecrtre"), for: .normal)
//        default:
//            break
//        }
//        UIView.animate(withDuration: 0.25) {
//            self.layoutIfNeeded()
//        }
//    }
//
//}


class RightView: UIView {
    
    // MARK: - Properties
    
    var buttonHeightConstraints: [Constraint] = []
    var block1: (() -> Void)?
    
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
    
    lazy var bgImageView2: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "bgqw")
        return bgImageView
    }()
    
    lazy var bgImageView3: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "hongqi")
        return bgImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: .white, textAlignment: .center)
        titleLabel.text = "Orders"
        return titleLabel
    }()
    
    lazy var rightTabView: RightTableView = {
        let rightTabView = RightTableView()
        return rightTabView
    }()
    
    lazy var buttons: [UIButton] = {
        let titles = ["Orders", "About", "Connect"]
        let images = ["iconqw", "iconqw", "iconqw"]
        let buttons = titles.enumerated().map { (index, title) in
            return createButton(title: title, image: images[index])
        }
        return buttons
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(bgImageView)
        addSubview(bgImageView1)
        bgImageView.addSubview(btn)
        bgImageView.addSubview(titleLabel)
        bgImageView.addSubview(bgImageView2)
        bgImageView2.addSubview(bgImageView3)
        bgImageView2.addSubview(rightTabView)
        buttons.forEach { bgImageView.addSubview($0) }
        
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.buttonClicked(self.buttons[0])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        bgImageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 45.constraintMultiplierTargetValue, left: SCREEN_WIDTH, bottom: 18.px(), right: 0.px()))
        }
        
        bgImageView1.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(bgImageView).offset(20.px())
            make.left.equalTo(bgImageView).offset(15.px())
            make.size.equalTo(CGSizeMake(31.px(), 33.px()))
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
        
        bgImageView3.snp.makeConstraints { make in
            make.top.equalTo(bgImageView2)
            make.left.equalTo(bgImageView2).offset(8.5.px())
            make.size.equalTo(CGSizeMake(180.px(), 217.5.px()))
        }
        
        rightTabView.snp.makeConstraints { make in
            make.left.right.equalTo(bgImageView2)
            make.top.equalTo(bgImageView3.snp.bottom).offset(13.5.px())
            make.bottom.equalTo(bgImageView2).offset(-10.px())
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
        }
    }
    
}
