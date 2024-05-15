//
//  HomeViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import MBProgressHUD
import HandyJSON

class HomeViewController: FCBaseViewController {
    
    var stranger: String?
    
    var particularly: String?
    
    lazy var oneView: FCHomeOneView = {
        let oneView = FCHomeOneView()
        return oneView
    }()
    
    lazy var twoView: FCHomeTwoView = {
        let twoView = FCHomeTwoView()
        return twoView
    }()
    
    lazy var rightView: RightView = {
        let rightView = RightView()
        return rightView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getAddressInfo()
        
        oneView.block1 = { [weak self] in
            self?.applyClick(self?.particularly ?? "")
        }
        
        oneView.block2 = { [weak self] in
            
        }
        
        oneView.block3 = { [weak self] in
            self?.addRightView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getHomeData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        hideRightView()
    }
    
}

extension HomeViewController {
    
    func addOneView() {
        view.addSubview(oneView)
        oneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addTwoView() {
        view.addSubview(twoView)
        twoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addRightView() {
        view.addSubview(rightView)
        rightView.block1 = { [weak self] in
            self?.hideRightView()
        }
        rightView.block2 = { [weak self] in
            self?.goSetVc()
        }
        rightView.block3 = { [weak self] in
            self?.pushWebVC( BASE_H5_URL  + "/alfredWhatsername", "", "")
        }
        rightView.block4 = { [weak self] in
            self?.pushWebVC( BASE_H5_URL + "/continuedDetected", "", "")
        }
        rightView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        delayTime(0.25) { [weak self] in
            self?.animateRightView()
        }
    }
    
    func animateRightView() {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.2,
                       options: .curveLinear) {
            self.rightView.alpha = 1
            self.rightView.bgImageView.snp.updateConstraints { make in
                make.left.equalToSuperview().offset(75.px())
            }
            self.rightView.layoutSubviews()
        }
    }
    
    func hideRightView() {
        UIView.animate(withDuration: 0.25) {
            self.rightView.alpha = 0
            self.rightView.bgImageView.snp.updateConstraints { make in
                make.left.equalToSuperview().offset(SCREEN_WIDTH)
            }
            self.rightView.layoutSubviews()
        }
    }
    
    func goSetVc() {
        let setVc = ProfileViewController()
        self.navigationController?.pushViewController(setVc, animated: true)
    }
    
    func getHomeData() {
        FCRequset.shared.requestAPI(params: [:], pageUrl: examined, method: .get) { [weak self] baseModel in
            let conceive = baseModel.conceive
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<HomeModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    let bigCardModel = model.untidily?.reddening
                    if let bigCardModel = bigCardModel {
                        self?.particularly = bigCardModel.particularly ?? ""
                        self?.twoView.removeFromSuperview()
                        self?.addOneView()
                        self?.oneView.model = bigCardModel
                    }else {
                        self?.oneView.removeFromSuperview()
                        self?.addTwoView()
                    }
                    //                    let stranger = model.stranger ?? ""
                    //                    if stranger == "1" {
                    //
                    //                    }else {
                    //
                    //                    }
                }
            }
        } errorBlock: { error in
            
        }
    }
    
    func getAddressInfo() {
        FCRequset.shared.requestAPI(params: [:], pageUrl: troubleObviously, method: .get) { [weak self] baseModel in
            let conceive = baseModel.conceive
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<EasilyModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model, let modelArray = model.palace, let jsonString = modelArray.toJSONString() {
                    self?.saveDataToLocalFile(jsonString, fileName: "palaceData.json")
                }
            }
        } errorBlock: { error in
            
        }
    }
    
    func applyClick(_ productID: String) {
        let dict = ["relations": productID]
        FCRequset.shared.requestAPI(params: dict, pageUrl: haveHeard, method: .post) { baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<EasilyModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    let weren = model.weren ?? ""
                    if weren.contains(SCHEME_URL) {
                        let array: [String] = weren.components(separatedBy: "relations=")
                        self.getProductDetailInfo(array.last ?? "", "")
                    }else{
                        self.pushWebVC(weren, "", "")
                    }
                }
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
}
