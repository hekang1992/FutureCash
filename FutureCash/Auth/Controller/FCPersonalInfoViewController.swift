//
//  FCPersonalInfoViewController.swift
//  FutureCash
//
//  Created by apple on 2024/5/8.
//

import UIKit
import MBProgressHUD
import HandyJSON

class FCPersonalInfoViewController: FCBaseViewController {
    
    var particularly: String?
    
    lazy var personalView: FCPersonalView = {
        let personalView = FCPersonalView()
        return personalView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        addPersonalView()
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
        FCRequset.shared.requestAPI(params: dict, pageUrl: brotherIndecisively, method: .post) { baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
}

