//
//  FCLoadingView.swift
//  FutureCash
//
//  Created by apple on 2024/4/12.
//

import UIKit
import Foundation
import Lottie

class LoadView: UIView {
    
    private lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var hudView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "loading.json", bundle: Bundle.main)
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(grayView)
        grayView.addSubview(hudView)
        setConstraints()
    }
    
    private func setConstraints() {
        grayView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        hudView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(CGSize(width: 120.px(), height: 120.px()))
        }
    }
    
}
