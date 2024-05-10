//
//  FCPopPCell.swift
//  FutureCash
//
//  Created by apple on 2024/5/10.
//

import UIKit

class FCPopPCell: UITableViewCell {
    
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Slicepessfe33"))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: Fredoka_Bold, size: 18.px())!, textColor: .white, textAlignment: .center)
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(bgImageView)
        bgImageView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        bgImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20.px())
            make.width.equalTo(319.px())
            make.bottom.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.edges.equalTo(bgImageView)
        }
    }
    
    var model: ChildrenModel? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let model = model else { return }
        nameLabel.text = model.employment
    }
    
}
