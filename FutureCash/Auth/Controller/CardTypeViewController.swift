//
//  CardTypeViewController.swift
//  FutureCash
//
//  Created by apple on 2024/4/26.
//

import UIKit
import HandyJSON
import TYAlertController
import MBProgressHUD

class CardTypeViewController: FCBaseViewController {
    
    var modelArray: [PModel]?
    
    lazy var typeView: CardTypeView = {
        let typeView = CardTypeView()
        return typeView
    }()
    
    lazy var changeView: ChangeTypeView = {
        let changeView = ChangeTypeView(frame: self.view.bounds)
        return changeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        addTypeView()
        getCardPic()
        typeView.block = { [weak self] in
            self?.popTypeView()
        }
    }
}

extension CardTypeViewController {
    
    func addTypeView() {
        view.insertSubview(typeView, belowSubview: navView)
        typeView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func popTypeView() {
        let alertVC = TYAlertController(alert: changeView, preferredStyle: .actionSheet)
        if let modelArray = self.modelArray {
            changeView.modelArray = modelArray
            changeView.collectionView.reloadData()
        }
        self.present(alertVC!, animated: true)
        changeView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func getCardPic() {
        let dict = ["relations": 2]
        FCRequset.shared.requestAPI(params: dict, pageUrl: wnnjennn, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<CardTypeModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    self?.modelArray = model.pwpnnemw
                    self?.typeView.modelArray = model.pwpnnemw
                    self?.typeView.collectionView.reloadData()
                }
            }
        } errorBlock: { error in
            
        }
        
    }
    
}
