//
//  FCPersonalInfoViewController.swift
//  FutureCash
//
//  Created by apple on 2024/5/8.
//

import UIKit
import MBProgressHUD
import HandyJSON
import TYAlertController

class FCPersonalInfoViewController: FCBaseViewController {
    
    var particularly: String?
    
    lazy var personalView: FCPersonalView = {
        let personalView = FCPersonalView()
        return personalView
    }()
    
    lazy var popView: FCPopPersonView = {
        let popView = FCPopPersonView(frame: self.view.bounds)
        return popView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        addPersonalView()
        personalView.block = {
            MBProgressHUD.show(text: "next")
        }
        personalView.block1 = { [weak self] cell,model in
            self?.alertEnum()
        }
        personalView.block2 = { [weak self] cell in
            self?.alertCity()
        }
        getPersonalInfo()
    }
    
}

extension FCPersonalInfoViewController {
    
    func addPersonalView() {
        view.insertSubview(personalView, belowSubview: navView)
        personalView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func getPersonalInfo() {
        let dict = ["relations": particularly ?? ""]
        FCRequset.shared.requestAPI(params: dict, pageUrl: brotherIndecisively, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<EasilyModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    let modelArray = model.except
                    if let modelArray = modelArray {
                        self?.personalView.modelArray = modelArray
                        self?.personalView.tableView.reloadData()
                    }
                }
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
    func alertEnum() {
        let alertVC = TYAlertController(alert: popView, preferredStyle: .actionSheet)
        self.present(alertVC!, animated: true)
        popView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func alertCity() {
        
    }
    
}

