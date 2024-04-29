//
//  CardTypeView.swift
//  FutureCash
//
//  Created by apple on 2024/4/26.
//

import UIKit
import MBProgressHUD

class CardTypeView: UIView {
    
    var block: (() -> Void)?
    
    var modelArray: [PModel]?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .clear
        return bgView
    }()
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView1 = UIImageView()
        iconImageView1.contentMode = .scaleAspectFill
        iconImageView1.clipsToBounds = true
        iconImageView1.image = UIImage(named: "bg1")
        iconImageView1.isUserInteractionEnabled = true
        return iconImageView1
    }()
    
    lazy var iconImageView2: UIImageView = {
        let iconImageView2 = UIImageView()
        iconImageView2.image = UIImage(named: "bg3")
        iconImageView2.isUserInteractionEnabled = true
        return iconImageView2
    }()
    
    lazy var iconImageView3: UIImageView = {
        let iconImageView3 = UIImageView()
        iconImageView3.image = UIImage(named: "bg2")
        iconImageView3.isUserInteractionEnabled = true
        return iconImageView3
    }()
    
    lazy var iconImageView4: UIImageView = {
        let iconImageView4 = UIImageView()
        iconImageView4.image = UIImage(named: "Slickigo")
        iconImageView4.isUserInteractionEnabled = true
        return iconImageView4
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = OverlapFlowLayout()
        layout.headerReferenceSize = CGSize(width: 100.px(), height: 16.px())
        layout.sectionInset = UIEdgeInsets(top: 16.px(), left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CardTypeCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        let radians = CGFloat(tan(-1.56 * Double.pi / 180))
        collectionView.transform = CGAffineTransform(rotationAngle: radians)
        return collectionView
    }()
    
    lazy var changeBtn: UIButton = {
        let changeBtn = UIButton(type: .custom)
        changeBtn.setImage(UIImage(named: "icon_but"), for: .normal)
        changeBtn.addTarget(self, action: #selector(changeBtnClick), for: .touchUpInside)
        let radians = CGFloat(tan(-1.56 * Double.pi / 180))
        changeBtn.transform = CGAffineTransform(rotationAngle: radians)
        return changeBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(iconImageView1)
        iconImageView1.addSubview(iconImageView2)
        iconImageView1.addSubview(iconImageView3)
        iconImageView1.addSubview(collectionView)
        iconImageView1.addSubview(iconImageView4)
        iconImageView1.addSubview(changeBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        iconImageView1.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
        if let vc = self.viewController  {
            let height = UIViewController.getTopBarHeights(for: vc)
            iconImageView2.snp.makeConstraints { make in
                make.centerX.equalTo(bgView)
                make.size.equalTo(CGSizeMake(375.px(), 159.px()))
                make.top.equalTo(height.totalHeight)
            }
        }
        iconImageView3.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(iconImageView2.snp.bottom).offset(13.px())
            make.size.equalTo(CGSizeMake(375.px(), 465.px()))
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView3)
            make.centerX.equalTo(iconImageView3)
            make.left.equalTo(iconImageView3).offset(30.px())
            make.bottom.equalTo(iconImageView3).offset(-92.px())
        }
        iconImageView4.snp.makeConstraints { make in
            make.top.equalTo(iconImageView3.snp.bottom).offset(-93.px())
            make.size.equalTo(CGSizeMake(68.px(), 117.px()))
            make.left.equalTo(iconImageView1).offset(29.px())
        }
        changeBtn.snp.makeConstraints { make in
            make.right.equalTo(iconImageView1).offset(-34.px())
            make.size.equalTo(CGSizeMake(146.px(), 63.px()))
            make.bottom.equalTo(iconImageView3.snp.bottom).offset(-100.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CardTypeView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CardTypeCell else {
            fatalError("Unable to dequeue CardTypeCell")
        }
        cell.model = modelArray?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let layout = collectionView.collectionViewLayout as? OverlapFlowLayout {
            layout.selectedIndexPath = indexPath == layout.selectedIndexPath ? nil : indexPath
            UIView.animate(withDuration: 0.3, animations: {
                collectionView.performBatchUpdates({
                    collectionView.collectionViewLayout.invalidateLayout()
                }, completion: nil)
            })
        }
    }
    
    @objc func changeBtnClick() {
        self.block?()
    }
    
}
