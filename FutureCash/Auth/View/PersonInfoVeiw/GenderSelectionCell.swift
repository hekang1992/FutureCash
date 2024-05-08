//
//  GenderSelectionCell.swift
//  FutureCash
//
//  Created by apple on 2024/5/8.
//

import UIKit

class GenderSelectionCell: UITableViewCell {
    
    lazy var maleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "man"), for: .normal)
        button.setImage(overlayImage(baseImage: UIImage(named: "man")!, overlay: UIImage(named: "Slicesssele")!), for: .selected)
        button.addTarget(self, action: #selector(selectGender(_:)), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    lazy var femaleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "woman"), for: .normal)
        button.setImage(overlayImage(baseImage: UIImage(named: "woman")!, overlay: UIImage(named: "Slicesssele")!), for: .selected)
        button.addTarget(self, action: #selector(selectGender(_:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(maleButton)
        addSubview(femaleButton)
        
        maleButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(maleButton.snp.height)
        }
        
        femaleButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(femaleButton.snp.height)
        }
    }
    
    @objc func selectGender(_ sender: UIButton) {
        maleButton.isSelected = (sender.tag == 0)
        femaleButton.isSelected = (sender.tag == 1)
    }
    
    private func overlayImage(baseImage: UIImage, overlay: UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(baseImage.size, false, 0)
        baseImage.draw(in: CGRect(origin: .zero, size: baseImage.size))
        overlay.draw(in: CGRect(origin: .zero, size: baseImage.size))
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resultImage
    }
    
}
