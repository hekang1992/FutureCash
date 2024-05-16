//
//  HomeViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import MBProgressHUD
import HandyJSON
import MJRefresh

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
            self?.pushOrderVcWithTypeStr("9")
        }
        oneView.block3 = { [weak self] in
            self?.addRightView()
        }
        twoView.block1 = { [weak self] str in
            self?.judguUrlContainSche(str)
        }
        twoView.block2 = { [weak self] in
            self?.pushOrderVcWithTypeStr("9")
        }
        twoView.block3 = { [weak self] in
            self?.addRightView()
        }
        self.twoView.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadHomeData))
        self.twoView.tableView.mj_header?.isAutomaticallyChangeAlpha = true
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
    
    @objc func loadHomeData() {
        getHomeData()
    }
    
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
        rightView.block5 = { [weak self] typeStr in
            self?.pushOrderVcWithTypeStr(typeStr)
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
                let model = JSONDeserializer<EasilyModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    let bigCardModel = model.untidily?.reddening
                    let bannerModelArray = model.filthy?.reddening
                    let fudaiModelArray = model.retired?.reddening
                    let productArray = model.palaced?.reddening
                    if let bigCardModel = bigCardModel {
                        self?.particularly = bigCardModel.particularly
                        self?.twoView.removeFromSuperview()
                        self?.addOneView()
                        self?.oneView.model = bigCardModel
                    }else {
                        if let bannerModelArray = bannerModelArray {
                            self?.oneView.removeFromSuperview()
                            self?.addTwoView()
                            self?.twoView.modelBannerArray = bannerModelArray
                            self?.twoView.productArray = productArray
                            self?.twoView.tableView.reloadData()
                            self?.twoView.pagerView1.reloadData()
                        }
                        if let fudaiModelArray = fudaiModelArray {
                            self?.twoView.fudaiBannerArray = fudaiModelArray
                            self?.twoView.pagerView2.reloadData()
                        }
                    }
                    let stranger = model.stranger ?? ""//fake product
                    if stranger == "1" {
                        
                    }else {
                        
                    }
                }
            }
            self?.twoView.tableView.mj_header?.endRefreshing()
        } errorBlock: { [weak self] error in
            self?.twoView.tableView.mj_header?.endRefreshing()
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
        FCRequset.shared.requestAPI(params: dict, pageUrl: haveHeard, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<EasilyModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    let weren = model.weren ?? ""
                    self?.judguUrlContainSche(weren)
                }
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
    func pushOrderVcWithTypeStr(_ str: String) {
        let orderVc = OrderViewController()
        orderVc.eight = str
        self.navigationController?.pushViewController(orderVc, animated: true)
    }
}
