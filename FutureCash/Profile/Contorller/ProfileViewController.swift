//
//  ProfileViewController.swift
//  FutureCash
//
//  Created by apple on 2024/3/25.
//

import UIKit

class ProfileViewController: FCBaseViewController {
    
    lazy var setView: FCSetView = {
        let setView = FCSetView()
        return setView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addNavView()
        self.navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        addSetView()
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
    
}
