//
//  DelAccountViewController.swift
//  FutureCash
//
//  Created by apple on 2024/4/25.
//

import UIKit

class DelAccountViewController: FCBaseViewController {
    
    lazy var delView: FCDelAccountView = {
        let delView = FCDelAccountView()
        return delView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addNavView()
        self.navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        addDelAccountView()
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

extension DelAccountViewController {
    
    func addDelAccountView() {
        view.insertSubview(delView, belowSubview: navView)
        delView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
