//
//  FCFaceViewController.swift
//  FutureCash
//
//  Created by apple on 2024/5/7.
//

import UIKit
import HandyJSON
import AAILiveness
import MBProgressHUD

class FCFaceViewController: FCBaseViewController {
    
    var particularly: String?
    
    lazy var faceView: FCFaceView = {
        let faceView = FCFaceView()
        return faceView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        addFaceView()
        faceView.block = { [weak self] in
            self?.getCishuFace()
        }
    }
}

extension FCFaceViewController {
    
    func addFaceView() {
        view.insertSubview(faceView, belowSubview: navView)
        faceView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func getCishuFace() {
        let dict = ["prove": "1", "shaking": "1"]
        FCRequset.shared.requestAPI(params: dict, pageUrl: thoughtfully, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<FaceModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    self?.checkLicense(model.stands ?? "")
                }
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
    func checkLicense(_ stands: String) {
        let checkResult = AAILivenessSDK.configLicenseAndCheck(stands)
        if checkResult == "SUCCESS" {
            let faceVc = AAILivenessViewController()
            faceVc.detectionSuccessBlk = { [weak self] rawVC, result in
                let livenessId = result.livenessId
                let bestImg = result.img
                let data: Data = Data.compressImageQuality(image: bestImg, maxLength: 1000)!
                self?.saveFaceInfo(data, livenessId, rawVC)
            }
            let navVc = BaseNavViewController(rootViewController: faceVc)
            navVc.modalPresentationStyle = .fullScreen
            self.present(navVc, animated: true)
        }else if checkResult == "LICENSE_EXPIRE"{
            MBProgressHUD.show(text: "License Expired")
        }else if checkResult == "APPLICATION_ID_NOT_MATCH"{
            MBProgressHUD.show(text: "Application ID Does Not Match")
        }else {
            MBProgressHUD.show(text: "Unknown Error Occurred")
        }
    }
    
    func saveFaceInfo(_ data: Data, _ shirted: String, _ vc: AAILivenessViewController) {
        let standing = "2"
        let relations = particularly ?? "" //product id
        let excuse = "10"
        let dict = ["standing": standing,
                    "relations": relations,
                    "excuse": excuse,
                    "shirted": shirted,
                    "black": "3"] as [String: Any]
        FCRequset.shared.uploadImageAPI(params: dict, pageUrl: nothingYoumanner, method: .post, data: data) { baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                UIView.animate(withDuration: 0.25) {
                    vc.navigationController?.dismiss(animated: true)
                }
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
}
