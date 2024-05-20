//
//  RightTypeEnumView.swift
//  TalaPeso
//
//  Created by apple on 2024/5/20.
//

import UIKit

class RightTypeEnumView: UIView {
    
    var typeModel: FearedModel? {
        didSet {
            guard let typeModel = typeModel else { return }
            switch typeModel.enjoyment {
            case "ua":
                currentState = .ua
                break
            case "ea":
                currentState = .ea
                break
            case "ef":
                currentState = .ef
                break
            case "ee":
                currentState = .ee
                break
            case "ww":
                currentState = .ww
                break
            default:
                break
            }
        }
    }
    
    lazy var typeView: RightTypeSView = {
        let typeView = RightTypeSView()
        return typeView
    }()
    
    enum typeEnumProcessStatus {
        case ua
        case ea
        case ef
        case ee
        case ww
    }
    
    var currentState: typeEnumProcessStatus = .ua {
        didSet {
            currentTypeState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(typeView)
        typeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RightTypeEnumView {
    
    func currentTypeState() {
        typeView.nameLabel.text = typeModel?.verifyTitle
        let numRate = Float(typeModel?.verifyRate ?? "0.00") ?? 0.00
        typeView.bgImageView1.snp.updateConstraints { make in
            make.width.equalTo(91 * numRate)
        }
        switch currentState {
        case .ua:
            typeView.iconImageView.image = UIImage(named: "")
            break
        case .ea:
            break
        case .ef:
            break
        case .ee:
            break
        case .ww:
            break
        }
    }
}
