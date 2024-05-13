//
//  FCWalletViewController.swift
//  FutureCash
//
//  Created by apple on 2024/5/11.
//

import UIKit
import TYAlertController
import MBProgressHUD

class FCWalletViewController: FCBaseViewController {
    
    var starttime: String?
    
    var particularly: String?
    
    lazy var popView: FCPopPersonView = {
        let popView = FCPopPersonView(frame: self.view.bounds)
        return popView
    }()
    
    lazy var walletView: FCWalletView = {
        let walletView = FCWalletView()
        return walletView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        starttime = DeviceInfo.getCurrentTime()
        view.addSubview(walletView)
        walletView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        walletView.block = { [weak self] dict in
            dict["relations"] = self?.particularly
            dict["guessed"] = "1"
            self?.saveWalletInfo(dict)
        }
        walletView.block1 = { [weak self] cell, model in
            self?.alertNormalEnum(cell, model)
        }
    }
    
}

extension FCWalletViewController {
    
    func alertNormalEnum(_ cell: FCWalletImageCell, _ emodel: ExceptModel) {
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
                    cell.cmodel = model
                })
            })
        }
    }
    
    func saveWalletInfo(_ dict: [String: Any]) {
        FCRequset.shared.requestAPI(params: dict, pageUrl: patientWanted, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                self?.getProductDetailInfo(self?.particularly ?? "", self?.starttime ?? "")
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
}
