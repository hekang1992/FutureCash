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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        addTypeView()
    }
}

extension CardTypeViewController {
    
    func addTypeView() {
        view.insertSubview(typeView, belowSubview: navView)
        typeView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
