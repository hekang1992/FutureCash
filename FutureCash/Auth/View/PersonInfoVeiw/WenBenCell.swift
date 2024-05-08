//
//  WenBenCell.swift
//  FutureCash
//
//  Created by apple on 2024/5/8.
//

import UIKit

class WenBenCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: UIColor.init(css: "#FFFFFF"), textAlignment: .left)
        nameLabel.text = "Gender"
        return nameLabel
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "Slicepessfe33")
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    lazy var nameField: UITextField = {
        let nameField = UITextField()
        nameField.font = UIFont(name: Fredoka_Medium, size: 18.px())
        nameField.textColor = UIColor.white
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: 15.px(), height: 15.px())
        nameField.leftView = leftView
        nameField.leftViewMode = .always
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Slicettt11qa")
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 0, y: 0, width: 25.px(), height: 25.px())
        nameField.rightView = imageView
        nameField.rightViewMode = .always
        return nameField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(bgImageView)
        bgImageView.addSubview(nameField)
        nameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16.px())
            make.width.equalTo(100.px())
            make.height.equalTo(20.px())
        }
        bgImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10.px())
            make.width.equalTo(319.px())
            make.height.equalTo(50.px())
        }
        nameField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 17.px()))
        }
        bgImageView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
