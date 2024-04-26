//
//  CardTypeViewController.swift
//  FutureCash
//
//  Created by apple on 2024/4/26.
//

import UIKit

class CardTypeViewController: FCBaseViewController {
    
    lazy var typeView: CardTypeView = {
        let typeView = CardTypeView()
        return typeView
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = OverlapFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CardTypeCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .randomColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        addTypeView()
        
        
//        setupCollectionView()
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}

extension CardTypeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func addTypeView() {
        view.insertSubview(typeView, belowSubview: navView)
        typeView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
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
    
}
