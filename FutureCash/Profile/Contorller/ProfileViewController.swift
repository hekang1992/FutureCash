//
//  ProfileViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit
import PopupDialog

class ProfileViewController: FCBaseViewController {
    
    lazy var setView: FCSetView = {
        let setView = FCSetView()
        return setView
    }()
    
    lazy var outView: FCLogOutView = {
        let outView = FCLogOutView(frame: self.view.bounds)
        return outView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        self.navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        addSetView()
        setView.block1 = {}
        setView.block2 = { [weak self] in
            self?.logOut()
        }
        setView.block3 = { [weak self] in
            self?.delAccount()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ProfileViewController {
    
    func addSetView() {
        view.insertSubview(setView, belowSubview: navView)
        setView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func logOut() {
        let dialog = PopupDialog(viewController: UIViewController(),
                                 transitionStyle: .zoomIn,
                                 tapGestureDismissal: false,
                                 panGestureDismissal: true,
                                 hideStatusBar: true)
        dialog.view.addSubview(outView)
        outView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
        outView.block = { [weak self] in
            self?.logOutSys()
        }
        present(dialog, animated: true, completion: nil)
    }
    
    func delAccount() {
        
    }
    
    func logOutSys() {
        
    }
    
}
