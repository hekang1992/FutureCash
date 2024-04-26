//
//  CardTypeCell.swift
//  FutureCash
//
//  Created by apple on 2024/4/26.
//

import UIKit

class CardTypeCell: UICollectionViewCell {
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "caidafj")
        return iconImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
