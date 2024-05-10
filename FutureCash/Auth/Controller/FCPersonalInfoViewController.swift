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
        personalView.block = { [weak self] dict in
            dict["relations"] = self?.particularly
            self?.savePersonalInfo(dict)
        }
        personalView.block1 = { [weak self] cell,model in
            self?.alertEnum(cell, model)
        }
        personalView.block2 = { [weak self] cell in
            self?.alertCity()
        }
        getPersonalInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let placeModels = loadDataFromLocalFile(fileName: "palaceData.json") {
            print("❤️placeModels>>>>>>>>>❤️\(placeModels)")
        } else {
            print("Failed to load place models from the file.")
        }
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
    
    func alertEnum(_ cell: FCWenBenCell, _ emodel: ExceptModel) {
        let alertVC = TYAlertController(alert: popView, preferredStyle: .actionSheet)
        if let children = emodel.children {
            popView.modelArray = children
            popView.tableView.reloadData()
        }
        self.present(alertVC!, animated: true)
        popView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
        popView.block1 = { [weak self] model in
            self?.delayTime(0.25, closure: {
                self?.dismiss(animated: true, completion: {
                    emodel.sapped = model.employment
                    emodel.excuse = model.excuse
                    cell.nameField.text = model.employment
                })
            })
        }
    }
    
    func alertCity() {
        
    }
    
    func savePersonalInfo(_ dict: [String: Any]) {
        FCRequset.shared.requestAPI(params: dict, pageUrl: theTime, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                self?.getProductDetailInfo(self?.particularly ?? "")
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
        
    }
    
}

