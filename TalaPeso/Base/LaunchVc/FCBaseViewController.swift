//
//  TLBaseViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import MBProgressHUD
import HandyJSON
import AdSupport

class FCBaseViewController: UIViewController {
    
    var totalTime = 60
    var countdownTimer: Timer!
    
    lazy var loginView: LoginView = {
        let loginView = LoginView()
        return loginView
    }()
    
    lazy var navView: FCNavView = {
        let navView = FCNavView()
        navView.isHidden = true
        return navView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navigationController?.delegate = self
    }
    
    func addNavView() {
        let heights = FCBaseViewController.getTopBarHeights(for: self)
        view.addSubview(navView)
        navView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(heights.totalHeight.px())
        }
    }
    
    func delayTime(_ delay: TimeInterval, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    func addLoginView() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        loginView.block1 = { [weak self] in
            self?.hideLoginView()
        }
        loginView.block2 = { [weak self] in
            self?.loginInfo()
        }
        loginView.block3 = { [weak self] in
            self?.getCode()
        }
        delayTime(0.25) { [weak self] in
            self?.animateLoginView()
        }
    }
    
    func hideLoginView() {
        self.loginView.phoneTed.text = ""
        self.loginView.codeView.deleteCodeStr()
        self.loginView.isHidden = true
        self.loginView.codeView.hideTextField.resignFirstResponder()
        self.loginView.phoneTed.resignFirstResponder()
        UIView.animate(withDuration: 0.25) {
            self.loginView.bgImageView.snp.updateConstraints { make in
                make.left.equalTo(self.loginView.bgView).offset(SCREEN_WIDTH)
            }
            self.loginView.layoutIfNeeded()
        }
    }
    
    func animateLoginView() {
        self.loginView.isHidden = false
        UIView.animate(withDuration: 0.25) {
            self.loginView.bgImageView.snp.updateConstraints { make in
                make.left.equalTo(self.loginView.bgView).offset(28.px())
            }
            self.loginView.layoutIfNeeded()
        }
    }
    
    func loginInfo() {
        let phoneStr = self.loginView.phoneTed.text ?? ""
        let codeStr = self.loginView.verifyCode
        if phoneStr.isEmpty {
            MBProgressHUD.show(text: "Please enter your phone number.")
        }else if codeStr.isEmpty {
            MBProgressHUD.show(text: "Please enter the verification code.")
        }else {
            self.walkedLogin()
        }
    }
    
    func getCode() {
        let phoneStr = self.loginView.phoneTed.text ?? ""
        if phoneStr.isEmpty {
            MBProgressHUD.show(text: "Please enter your phone number.")
        }else {
            self.horoughly(phoneStr)
        }
    }
    
    func startTimer() {
        self.loginView.btn2.isEnabled = false
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime > 0 {
            totalTime -= 1
            self.loginView.btn2.setTitle("\(self.totalTime)", for: .normal)
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        self.loginView.btn2.isEnabled = true
        self.loginView.btn2.setTitle("Send", for: .normal)
        totalTime = 60
    }
    
    func getApplePush() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_PUSH), object: nil)
    }
    
    func getAppleGoogle() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_GOOGLE), object: nil)
    }
    
    func getAppleLocation() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_LOCATION), object: nil)
    }
    
    func getRootVcPush() {
        FCNotificationCenter.post(name: NSNotification.Name(FCAPPLE_ROOT_VC), object: nil)
    }
    
}

extension FCBaseViewController: UINavigationControllerDelegate {
    
    func saveDataToLocalFile(_ jsonString: String, fileName: String) {
        guard let data = jsonString.data(using: .utf8) else { return }
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent(fileName)
        do {
            try data.write(to: fileURL, options: .atomic)
//            print("Saved data to \(fileURL.absoluteString)")
        } catch {
            print("Failed to write JSON data to local file: \(error.localizedDescription)")
        }
    }
    
    func loadDataFromLocalFile(fileName: String) -> [PlaceModel]? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent(fileName)
        do {
            let data = try Data(contentsOf: fileURL)
            if let jsonString = String(data: data, encoding: .utf8) {
                return convertJsonStringToModel(jsonString: jsonString)
            }
        } catch {
            print("Failed to read from local file: \(error.localizedDescription)")
        }
        return nil
    }
    
    func convertJsonStringToModel(jsonString: String) -> [PlaceModel]? {
        return [PlaceModel].deserialize(from: jsonString) as? [PlaceModel]
    }
    
    func horoughly(_ phone: String) {
        let dict = ["judge": phone, "killing": "1"]
        FCRequset.shared.requestAPI(params: dict, pageUrl: rightThoroughly, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            MBProgressHUD.show(text: wanting)
            if conceive == 0 || conceive == 00 {
                self?.startTimer()
            }
        } errorBlock: { error in
            
        }
    }
    
    //登陆
    func walkedLogin() {
        let starttime = DeviceInfo.getCurrentTime()
        let phoneStr = self.loginView.phoneTed.text ?? ""
        let codeStr = self.loginView.verifyCode
        let dict = ["temperance": phoneStr, "females": codeStr, "suggest": "1"]
        FCRequset.shared.requestAPI(params: dict, pageUrl: walkedWhole, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            MBProgressHUD.show(text: wanting)
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<LoginModel>.deserializeFrom(dict: baseModel.easily)
                guard let model = model else { return }
                LoginFactory.saveLoginInfo(model.temperance ?? "", model.temple ?? "")
                self?.miandian(productID: "", startTime: starttime, type: "1")
                self?.getAppleLocation()
                self?.getAppleGoogle()
                self?.getApplePush()
                self?.getRootVcPush()
            }
        } errorBlock: { error in
            
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func getProductDetailInfo(_ productID: String, _ startTime: String) {
        let dict = ["relations": productID, "proposed": "1", "happenings": "2"]
        FCRequset.shared.requestAPI(params: dict, pageUrl: henry, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<EasilyModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    let enjoyment = model.feared?.enjoyment as? String ?? ""
                    let suffused = model.given?.suffused as? String ?? ""
                    if !enjoyment.isEmpty {
                        self?.pushNextVc(model.feared?.enjoyment ?? "", productID, startTime)
                    }else {
                        self?.orderIDWithNext(suffused, productID, startTime)
                    }
                }
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
    func pushNextVc(_ type: String, _ productID: String, _ startTime: String) {
        switch type {
        case "ua": 
            let cardVc = FCCardTypeViewController()
            cardVc.particularly = productID
            self.navigationController?.pushViewController(cardVc, animated: true)
            self.miandian(productID: productID, startTime: startTime, type: "4")
            break
            
        case "ea":
            let peronalVc = FCPersonalInfoViewController()
            peronalVc.particularly = productID
            self.navigationController?.pushViewController(peronalVc, animated: true)
            self.miandian(productID: productID, startTime: startTime, type: "5")
            break
            
        case "ef":
            let workVc = FCWorkInfoViewController()
            workVc.particularly = productID
            self.navigationController?.pushViewController(workVc, animated: true)
            self.miandian(productID: productID, startTime: startTime, type: "6")
            break
            
        case "ee":
            let contactVc = FCContactViewController()
            contactVc.particularly = productID
            self.navigationController?.pushViewController(contactVc, animated: true)
            self.miandian(productID: productID, startTime: startTime, type: "7")
            break
            
        case "ww":
            let bankVc = FCBankInfoViewController()
            bankVc.particularly = productID
            self.navigationController?.pushViewController(bankVc, animated: true)
            self.miandian(productID: productID, startTime: startTime, type: "8")
            break
            
        default: break
            
        }
    }
    
    func orderIDWithNext(_ orderID: String, _ productID: String, _ startTime: String) {
        let dict = ["holborn": orderID]
        FCRequset.shared.requestAPI(params: dict, pageUrl: alfredsConscious, method: .post) { [weak self] baseModel in
            let conceive = baseModel.conceive
            let wanting = baseModel.wanting ?? ""
            if conceive == 0 || conceive == 00 {
                let model = JSONDeserializer<EasilyModel>.deserializeFrom(dict: baseModel.easily)
                if let model = model {
                    self?.pushWebVC(model.weren ?? "", productID, startTime)
                }
            }else {
                MBProgressHUD.show(text: wanting)
            }
        } errorBlock: { error in
            
        }
    }
    
    func pushWebVC(_ url: String, _ productID: String, _ startTime: String) {
        let webVc = WebViewController()
        let urlString = url + LoginFactory.getLoginParas()
        guard let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Failed to encode URL")
            return
        }
        guard URL(string: encodedURLString) != nil else {
            print("Failed to create encoded URL")
            return
        }
        webVc.url = urlString
        navigationController?.pushViewController(webVc, animated: true)
        self.miandian(productID: productID, startTime: startTime, type: "9")
    }
    
    func miandian(productID: String, startTime: String, type: String) {
        let model = LocationManager.shared.locatinModel        
        let smell = productID
        let skilled = type
        let unsatisfactory = DeviceInfo.getIdfv()
        let politics = DeviceInfo.getIDFA()
        let needed = model.longitude
        let alcoholic = model.latitude
        let arguing = startTime
        let liked = DeviceInfo.getCurrentTime()
        let dict = ["smell": smell, 
                    "skilled": skilled,
                    "unsatisfactory": unsatisfactory,
                    "politics": politics,
                    "needed": needed,
                    "alcoholic": alcoholic,
                    "arguing": arguing,
                    "liked": liked] as [String: Any]
        FCRequset.shared.requestAPI(params: dict, pageUrl: theBrother, method: .post) { baseModel in
           let conceive = baseModel.conceive
            if conceive == 0 || conceive == 00 {
                print("🚗埋点>>>\(type)>>>success🚗")
            }
        } errorBlock: { error in
            
        }
    }
    
    func judguUrlContainSche(_ url: String) {
        if url.contains(SCHEME_URL) {
            let array = url.components(separatedBy: "relations=")
            self.getProductDetailInfo(array.last ?? "", "")
        }else{
            if !url.isEmpty {
                self.pushWebVC(url, "", "")
            }
        }
    }
    
}
