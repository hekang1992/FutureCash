//
//  LaunchViewController.swift
//  TaraLoan
//
//  Created by apple on 2024/3/25.
//

import UIKit

class LaunchViewController: TLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dict = DeviceInfo.deviceInfo()
        view.backgroundColor = .systemBlue
        
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