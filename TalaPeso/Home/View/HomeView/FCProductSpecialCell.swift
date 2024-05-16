//
//  FCProductSpecialCell.swift
//  TalaPeso
//
//  Created by apple on 2024/5/16.
//

import UIKit

class FCProductSpecialCell: UITableViewCell {

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "productcelsslimage")
        return bgImageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20.px())
            make.left.equalToSuperview().offset(6.px())
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
