//
//  FacePhotoViewController.swift
//  FutureCash
//
//  Created by apple on 2024/5/6.
//

import UIKit
import Kingfisher

class FacePhotoViewController: FCBaseViewController {
    
    var imageUrl: String?
    
    lazy var photoView: FCPhotoView = {
        let photoView = FCPhotoView()
        photoView.iconImageView3.kf.setImage(with: URL(string: imageUrl ?? ""))
        return photoView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navView.isHidden = false
        self.navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        addTypeView()
    }
}

extension FacePhotoViewController {
    
    func addTypeView() {
        view.insertSubview(photoView, belowSubview: navView)
        photoView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
